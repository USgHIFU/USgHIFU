%--------------------------------------------------------------------------
%   Inquire the voltage of the power amplifier according to the ID, and
%   return the value.
%   If the ID is invalid, return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-10-2015
%--------------------------------------------------------------------------

function Volt = echoPowerAmp(PowerAmp,PowerAmpId)

Volt = [];

Action = getPowerAmpAction;
BytePowerAmpId = getPowerAmpIdByte(PowerAmpId);
BytesVolt = getVoltageBytes(Action.ECHO,[]);
ByteCheck = getCheckByte(BytePowerAmpId,BytesVolt);

if ~isempty(ByteCheck)
    BytesSend = [BytePowerAmpId;BytesVolt;ByteCheck];
    fwrite(PowerAmp.Serial,BytesSend,'uint8');
    BytesRead = fread(PowerAmp.Serial,4,'uint8');
    IsLengthValid = (length(BytesRead) == 4);
    if IsLengthValid
        IsEchoedBytesValid = validateEcho(BytesRead,BytePowerAmpId);
        if IsEchoedBytesValid
            Volt = bytes2voltage(BytesRead);
        end            
    end
end            
%--------------------------------------------------------------------------
%   Start the power amplifier with the set voltage according to the ID and
%   the value of voltage. If the power amplifier is started successfully,
%   return true, or else return false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function Success = startSinglePowerAmp(PowerAmp,PowerAmpId,Volt)

Success = false;
Action = getPowerAmpAction;
BytePowerAmpId = getPowerAmpIdByte(PowerAmpId);
BytesVolt = getVoltageBytes(Action.START,Volt);
ByteCheck = getCheckByte(BytePowerAmpId,BytesVolt);

if ~isempty(ByteCheck)
    BytesSend = [BytePowerAmpId;BytesVolt;ByteCheck];
    fwrite(PowerAmp.Serial,BytesSend,'uint8');
    BytesRead = fread(PowerAmp.Serial,4,'uint8');
    if checkReadBytes(BytesRead,BytesSend)
        Success = true;
    end
end
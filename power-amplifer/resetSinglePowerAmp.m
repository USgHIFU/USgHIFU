%--------------------------------------------------------------------------
%   Reset single power amplifier according to its ID, and if the power
%   amplifier is reset, return true, or else return false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function Success = resetSinglePowerAmp(PowerAmp,PowerAmpId)

Success = false;
Action = getPowerAmpAction;
BytePowerAmpId = getPowerAmpIdByte(PowerAmpId);
BytesVolt = getVoltageBytes(Action.RESET,[]);
ByteCheck = getCheckByte(BytePowerAmpId,BytesVolt);

if ~isempty(ByteCheck)
    BytesSend = [BytePowerAmpId;BytesVolt;ByteCheck];
    fwrite(PowerAmp.Serial,BytesSend,'uint8');
    BytesRead = fread(PowerAmp.Serial,4,'uint8');
    if checkReadBytes(BytesRead,BytesSend)
         Success = true;
    end
end
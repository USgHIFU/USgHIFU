%--------------------------------------------------------------------------
%   If all the power amplifiers are operated (RESET or START), return the
%   flag of true, or return the flag of false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function SendToAllPowerAmps = flagSendToAllPowerAmps(PowerAmpId)

SendToAllPowerAmps = false;

if uint8(PowerAmpId) == 0
    SendToAllPowerAmps = true;
end
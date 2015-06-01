%--------------------------------------------------------------------------
%   Package the valid ID of power amplifier into a byte, and return it.
%   If the ID is invalid, return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function BytePowerAmpId = getPowerAmpIdByte(ID)

BytePowerAmpId = [];

if ~isempty(validatePowerAmpId(ID))
%   Set the 8th bit to 1
    BytePowerAmpId = validatePowerAmpId(ID) + 128;
end
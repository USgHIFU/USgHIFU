%--------------------------------------------------------------------------
%   Ensure that the ID of power amplifier is valid. Return the ID if it is
%   valid, or else return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function PowerAmpId = validatePowerAmpId(ID)

DEV_COUNT_MAX = 127;

if 0 <= ID && ID <= DEV_COUNT_MAX
    PowerAmpId = fix(ID);
else
    PowerAmpId = [];
end
%--------------------------------------------------------------------------
%   Ensure that the voltage of power amplifier is valid. Return the voltage
%   if it is valid, or else return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function Volt = validateVoltage(Volt)

VOLT_MAX = 18;

if ~((0 <= Volt) && (Volt <= VOLT_MAX))
    Volt = [];
end
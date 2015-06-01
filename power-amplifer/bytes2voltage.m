%--------------------------------------------------------------------------
% Convert the echoed bytes into the voltage in the operation mode of ECHO.
% Return null if the echoed bytes are invalid.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function Volt = bytes2voltage(bytesEcho)

Volt = [];

bitHigh = bitget(bytesEcho(2),1);
if bitHigh
    Volt = (bytesEcho(3) + 128) / 10;
else
    Volt = bytesEcho(3) / 10;
end

Volt = validateVoltage(Volt);
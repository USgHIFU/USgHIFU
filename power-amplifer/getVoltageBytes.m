%--------------------------------------------------------------------------
%   Package the operation modes (RESET, START, ECHO) and the voltage to
%   send into two bytes, and return them.
%   If the voltage is invalid, return the empty. The modes of RESET and ECHO
%   are exceptions because they don't need the value of voltage.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function BytesVolt = getVoltageBytes(Action,Volt)

BytesVolt = [];

switch Action
    case 'RESET'
        BytesVolt = [0;0];
    case 'START'
        if ~isempty(validateVoltage(Volt))
%   change the rangle of sentVoltage to 0~255            
            Volt = fix(validateVoltage(Volt) * 10);
            if Volt >= 128
                BytesVolt(1) = 65;
            else
                BytesVolt(1) = 64;
            end
            BytesVolt(2) = bitand(Volt,127);
            BytesVolt = [BytesVolt(1);BytesVolt(2)];
        end
    case 'ECHO'
        BytesVolt = [32;0];
end
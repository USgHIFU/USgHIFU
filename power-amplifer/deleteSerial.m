%--------------------------------------------------------------------------
%   Delete the object of serial port
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-26-2015
%--------------------------------------------------------------------------

function deleteSerial(serial)

if ~isempty(serial)
    fclose(serial);
    delete(serial);
end
%--------------------------------------------------------------------------
%   Find the avaiable serial ports and return the ports.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015
%--------------------------------------------------------------------------

function AvailablePort = scanSerial

AvailablePort = [];
Port = getPort;

for iPort = 1:size(Port,1)
    Serial = newSerial(Port(iPort,:));
    if isvalid(Serial)
        AvailablePort = [AvailablePort;Serial.Port];
        deleteSerial(Serial);
    end
end
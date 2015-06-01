%--------------------------------------------------------------------------
%   Create the object of power amplifier, and return the object if
%   successfully creating the object, or else return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function PowerAmp = newPowerAmp

AvailablePort = scanSerial;
Port = identifyPowerAmp(AvailablePort);

if ~isempty(Port)
    PowerAmp.Serial = newSerial(Port);
    PowerAmp.Action = [];
else
    PowerAmp = [];
end
    
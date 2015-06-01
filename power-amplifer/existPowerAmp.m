%--------------------------------------------------------------------------
%   Ensure that the object of power amplifiers has been created. And return
%   true if the object exists, or else return false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-10-2015
%--------------------------------------------------------------------------

function IsPowerAmpExisting = existPowerAmp(hFigure)

IsPowerAmpExisting = false;

if isempty(getappdata(hFigure,'power_amp'))
    PowerAmp = newPowerAmp;
    if isempty(PowerAmp)
        return
    else
        setappdata(hFigure,'power_amp',PowerAmp);
        IsPowerAmpExisting = true;
    end
else
    IsPowerAmpExisting = true;
end
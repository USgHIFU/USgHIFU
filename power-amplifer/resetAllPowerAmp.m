function [Success,ErrorPowerAmpId] = resetAllPowerAmp(PowerAmp)

ID_MIN = 1;
ID_MAX = 112;

Success = false;
ErrorPowerAmpId = [];

for PowerAmpId = ID_MIN:ID_MAX
    SafeCounter = 0;
    while true
        pause(0.1);
        if resetSinglePowerAmp(PowerAmp,PowerAmpId);
            break
        else
            SafeCounter = SafeCounter + 1;
        end
        
        if SafeCounter == 4
            ErrorPowerAmpId = [ErrorPowerAmpId;PowerAmpId];
            break
        end
    end
end

if isempty(ErrorPowerAmpId)
    Success = true;
end
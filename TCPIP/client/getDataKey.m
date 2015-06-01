%--------------------------------------------------------------------------
%   Get the keyword of data if data is a pure string, and search the
%   keyword in the list of keywords according to the input 'Data'. If the
%   data is string-wrapped value, return empty.
%--------------------------------------------------------------------------
%   AUTHOR: WANG Shoubei
%   Last modified by JI Xiang APR-14-2015
%--------------------------------------------------------------------------

function DataKey = getDataKey(Data)

DataKey = [];
IsDataString = isempty(str2num(Data));
Key = getKey;
if IsDataString
    DataKey = 'NONE';
    switch Data
        case Key.SpotNum
            DataKey = Key.SpotNum;
        case Key.SpotPosX
            DataKey = Key.SpotPosX;
        case Key.SpotPosY
            DataKey = Key.SpotPosY;
        case Key.SpotPosZ
            DataKey = Key.SpotPosZ;
        case Key.SonicationTime
            DataKey = Key.SonicationTime;
        case Key.SonicationPeriod
            DataKey = Key.SonicationPeriod;
        case Key.DutyCycle
            DataKey = Key.DutyCycle;
        case Key.CoolingTime
            DataKey = Key.CoolingTime;
    end
end
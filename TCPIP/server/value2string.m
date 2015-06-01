function Str = value2string(Param)

Str = [];

if isempty(Param.Key) || isempty(Param.Value)
    return
end

Key = getKey;
switch Param.Key
    case Key.SpotNum
        Str = sprintf('%d;',Param.Value);
    case Key.SpotPosX
        Str = sprintf('%f;',Param.Value);
    case Key.SpotPosY
        Str = sprintf('%f;',Param.Value);
    case Key.SpotPosZ
        Str = sprintf('%f;',Param.Value);
    case Key.SonicationTime
        Str = sprintf('%d;',Param.Value);
    case Key.SonicationPeriod
        Str = sprintf('%d;',Param.Value);
    case Key.DutyCycle
        Str = sprintf('%d;',Param.Value);
    case Key.CoolingTime
        Str = sprintf('%d;',Param.Value);
end
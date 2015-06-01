function [Success, Err] = sendPlan(Tcpip,Plan)

Key = getKey;
Param = struct('Key',Key.SpotNum,'Value',Plan.SpotNum);
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.SpotPosX;
Param.Value = Plan.SpotPosX;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.SpotPosY;
Param.Value = Plan.SpotPosY;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.SpotPosZ;
Param.Value = Plan.SpotPosZ;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.SonicationTime;
Param.Value = Plan.SonicationTime;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.SonicationPeriod;
Param.Value = Plan.SonicationPeriod;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.DutyCycle;
Param.Value = Plan.DutyCycle;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end

Param.Key = Key.CoolingTime;
Param.Value = Plan.CoolingTime;
[Success, Err] = sendPlanParam(Tcpip,Param);
if ~Success
    return
end
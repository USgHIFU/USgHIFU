%--------------------------------------------------------------------------
%   The parameter is struct-formatted, and has a key-value pair. Send the
%   parameter of the plan, and return the status flag of success and error.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by MAR-19-2015
%--------------------------------------------------------------------------

function [Success, Err] = sendPlanParam(Tcpip,Param)

Success = false;
Err = Param.Key;

if ~sendString(Tcpip,Param.Key);
    return
end

Str = value2string(Param);
if isempty(Str)
    return
else
    if sendString(Tcpip,Str)
        Err = [];
        Success = true;
    else
        return
    end
end
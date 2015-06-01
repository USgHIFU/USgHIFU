%--------------------------------------------------------------------------
%   Receive the parameters of treatment plan, and save the values of
%   treatment plan.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Success = receivePlan(hFigure,Str)

Success = false;
Server = getappdata(hFigure,'server');
Key = getDataKey(Str);

if ~isempty(Server.PlanParam) && isempty(Key)
    Value = str2num(Str);
    Plan = getappdata(hFigure,'plan');
    Plan = setfield(Plan,Server.PlanParam,Value);
    setappdata(hFigure,'plan',Plan);
    Server.PlanParam = [];
    setappdata(hFigure,'server',Server);
    Success = true;
elseif isempty(Server.PlanParam) && ~isempty(Key)
    Server.PlanParam = Key;
    setappdata(hFigure,'server',Server);
    Success = true;
end
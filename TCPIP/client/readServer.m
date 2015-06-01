%--------------------------------------------------------------------------
%   Bytesavailable function.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function readServer(hObject,eventdata,hFigure)

Server = getappdata(hFigure,'server');
Str = receiveString(Server.Tcpip);
%   debug
% disp(Str)

if ~Server.FlagSessionStarted
    SessionTerm = getSessionTerm;
    if strcmp(Str,SessionTerm.Header)
        Server.FlagSessionStarted = true;
        Server.FlagSessionFinished = false;
        setappdata(hFigure,'server',Server);
    end
else
    SessionType = getSessionType;
    if isempty(Server.SessionType)
        if strcmp(Str,SessionType.Plan) || ...
           strcmp(Str,SessionType.Command) || ...
           strcmp(Str,SessionType.Status)
            Server.SessionType = Str;
            setappdata(hFigure,'server',Server);
        end
    else
        SessionTerm = getSessionTerm;
        if strcmp(Str,SessionTerm.Terminator)
            Server.FlagSessionStarted = false;
            Server.FlagSessionFinished = true;
            Server.SessionType = [];
            setappdata(hFigure,'server',Server);
            return
        end
        switch Server.SessionType
            case SessionType.Plan
                receivePlan(hFigure,Str);
            case SessionType.Command
                receiveCommand(hFigure,Str);
        end
    end
end
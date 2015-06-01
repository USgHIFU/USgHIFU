%--------------------------------------------------------------------------
%   Create the server, and set the default properties.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Server = newServer

Server = [];
Tcpip = newTcpip;
if isvalid(Tcpip)
    Server.Tcpip = Tcpip;
    Server.FlagSessionStarted = false;
    Server.FlagSessionFinished = true;
    Server.SessionType = [];
    Server.PlanParam = [];
    Server.Error = [];
end
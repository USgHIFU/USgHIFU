%--------------------------------------------------------------------------
%   Determine whether the server exists.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function IsServerExisting = existServer(hFigure)

IsServerExisting = false;

if isempty(getappdata(hFigure,'server'))
    Server = newServer;
    if isempty(Server)
        return
    else        
        Server.Tcpip.BytesAvailableFcn = {@readServer,hFigure};
        setappdata(hFigure,'server',Server);
        IsServerExisting = true;
    end
else
    Server = getappdata(hFigure,'server');
    Server.Tcpip.BytesAvailableFcn = {@readServer,hFigure};
    IsServerExisting = true;
end
%--------------------------------------------------------------------------
%   Delete the server.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function deleteServer(hFigure)

if ~isempty(getappdata(hFigure,'server'))
    Server = getappdata(hFigure,'server');
    deleteTcpip(Server.Tcpip);
    Server = [];
    setappdata(hFigure,'server',Server);
end
function deleteClient(hFigure)

if existClient(hFigure)
    Client = getappdata(hFigure,'client');
    deleteTcpip(Client.Tcpip);
    Client = [];
    setappdata(hFigure,'client',Client);
end
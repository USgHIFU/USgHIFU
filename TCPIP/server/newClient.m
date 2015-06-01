%--------------------------------------------------------------------------
%   Create the object of client, return the object if successfully created,
%   or else return empty.
%--------------------------------------------------------------------------
%   AUTHOR: WANG Shoubei
%   Last modified by JI Xiang APR-15-2015
%--------------------------------------------------------------------------

function Client = newClient

Client = [];
Tcpip = newTcpip;
if isvalid(Tcpip)
    Client.Tcpip = Tcpip;
%   Type:   Plan, Command, Status
    Client.SessionType = [];
    Client.Error = [];
else
    return
end
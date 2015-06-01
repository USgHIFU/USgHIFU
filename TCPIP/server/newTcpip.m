%--------------------------------------------------------------------------
%   Create the object of tcpip, and return the object if successfully
%   connected, or else return the invalid object.
%--------------------------------------------------------------------------
%   AUTHOR: WANG Shoubei
%   Last modified by JI Xiang APR-14-2015
%--------------------------------------------------------------------------

function Tcpip = newTcpip

Param = getTcpipParam;
Tcpip = instrfind('RemoteHost',Param.Address,'RemotePort',Param.Port);
deleteTcpip(Tcpip);

Tcpip = tcpip(Param.Address,Param.Port,'NetworkRole',Param.NetworkRole);

Tcpip.ReadAsyncMode = Param.ReadAsyncMode;
Tcpip.OutputBufferSize = Param.OutputBufferSize;
Tcpip.InputBufferSize = Param.InputBufferSize;
Tcpip.BytesAvailableFcnMode = Param.BytesAvailableFcnMode;
Tcpip.Timeout = Param.Timeout;

try
    fopen(Tcpip);
catch Exception
    handleExceptionFopen(Exception,Tcpip)
end
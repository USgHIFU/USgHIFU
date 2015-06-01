%--------------------------------------------------------------------------
%   Create the object of tcpip, and connect the object.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
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
%--------------------------------------------------------------------------
%   Receive the string and echo the same string.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Str = receiveString(Tcpip)

Str = fscanf(Tcpip);
Str = cutTerminator(Str);
fprintf(Tcpip,Str);
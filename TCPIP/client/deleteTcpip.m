%--------------------------------------------------------------------------
%   Close the tcpip and delete the object of tcpip.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang
%--------------------------------------------------------------------------

function deleteTcpip(Tcpip)

if ~isempty(Tcpip)
    fclose(Tcpip);
    delete(Tcpip);
end
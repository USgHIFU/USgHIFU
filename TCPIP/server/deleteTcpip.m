function deleteTcpip(Tcpip)

if ~isempty(Tcpip)
    fclose(Tcpip);
    delete(Tcpip);
end
    
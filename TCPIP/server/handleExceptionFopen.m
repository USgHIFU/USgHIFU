function handleExceptionFopen(Exception,Tcpip)

logError(Exception);
deleteTcpip(Tcpip);
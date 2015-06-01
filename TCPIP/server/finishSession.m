function Success = finishSession(Tcpip)

Success = false;
SESSION_TERMINATOR = 'FINISHING...';
if sendString(Tcpip,SESSION_TERMINATOR)
    Success = true;
end
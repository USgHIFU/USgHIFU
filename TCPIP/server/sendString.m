function Success = sendString(Tcpip,Str) 

Success = false;

fprintf(Tcpip,Str);
StrWithTerminator = sprintf('%s\n',Str);
StrReceived = fscanf(Tcpip);
if strcmp(StrWithTerminator,StrReceived)
    Success = true;
end

flushinput(Tcpip);
flushoutput(Tcpip);
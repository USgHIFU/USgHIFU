%--------------------------------------------------------------------------
%   Start the session, and return the status.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Success = startSession(Tcpip,SessionType)

Success = false;
SESSION_HEADER = 'CONNECTING...';
Success4Header = sendString(Tcpip,SESSION_HEADER);
Success4SessionType = sendString(Tcpip,SessionType);
if Success4Header && Success4SessionType    
    Success = true;
end
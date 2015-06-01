%--------------------------------------------------------------------------
%   Check that the echoed bytes are valid according to the sent bytes.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function Valid = checkReadBytes(BytesRead,BytesSend)

Valid = false;
IsLengthValid = (length(BytesRead) == 4);

if IsLengthValid
    IsReadBytesValid = ((BytesRead(1) == (BytesSend(1) - 128)) &&...
                        (BytesRead(2) == BytesSend(2)) &&...
                        (BytesRead(3) == BytesSend(3)) &&...
                        (BytesRead(4) == BytesSend(4)));
    if IsReadBytesValid
        Valid = true;
    end
end
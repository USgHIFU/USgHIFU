%--------------------------------------------------------------------------
%   Check that the echoed bytes are valid according to the byte of ID.
%   Return 1 if the bytes are valid, or else return 0.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function IsEchoBytesValid = validateEcho(BytesEcho,BytePowerAmpId)

IsEchoBytesValid = false;
IsPowerAmpIdValid = (BytesEcho(1) == BytePowerAmpId - 128);

if IsPowerAmpIdValid
    IsRestBytesValid = ...
            (BytesEcho(4) == getCheckByte(BytesEcho(1),BytesEcho(2:3)));
    if IsRestBytesValid
        IsEchoBytesValid = true;
    end
end
%--------------------------------------------------------------------------
%   Get the byte of check according to the byte of ID and the bytes of
%   voltage.
%   If the byte of ID or the bytes of voltage is invalid, return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function ByteCheck = getCheckByte(BytePowerAmpId,ByteVolt)

ByteCheck = [];

if ~isempty(BytePowerAmpId) && ~isempty(ByteVolt)
    ByteCheck = bitand((BytePowerAmpId + sum(ByteVolt)),127);
end
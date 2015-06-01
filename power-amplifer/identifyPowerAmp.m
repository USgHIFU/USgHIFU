%--------------------------------------------------------------------------
%   Send the test bytes to the available ports of serial, and read the
%   echoed bytes. Find the connected port of the power ampilifers according
%   to the valid echoed bytes.
%   If no valid echoed bytes exist, return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-09-2015
%--------------------------------------------------------------------------

function Port4PowerAmp = identifyPowerAmp(Port)
%   test data: byteSend and byteEcho
BYTES_SEND = hex2dec(['81';'00';'00';'01']);
BYTES_ECHO = hex2dec(['01';'00';'00';'01']);

Port4PowerAmp = [];

for iPort = 1:size(Port,1)
    Serial = newSerial(Port(iPort,:));
    fwrite(Serial,BYTES_SEND,'uint8');
    BytesRead = fread(Serial,4,'uint8');
    IsLengthValid = (length(BytesRead) == 4);
    if IsLengthValid 
        IsReadDataValid = (BytesRead(1) == BYTES_ECHO(1)) &&...
                          (BytesRead(2) == BYTES_ECHO(2)) &&...
                          (BytesRead(3) == BYTES_ECHO(3)) &&...
                          (BytesRead(4) == BYTES_ECHO(4));
        if IsReadDataValid && isempty(Port4PowerAmp)
            Port4PowerAmp = Serial.Port;
        end
    end
    deleteSerial(Serial);
end
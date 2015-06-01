%--------------------------------------------------------------------------
%   1. Find the exist serial ports and then delete them;
%   2. Create the serial object specified by input 'port';
%   3. Set the parameters;
%   4. Open the created serial object.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015.
%--------------------------------------------------------------------------

function Serial = newSerial(Port)

Serial = instrfind('Type','serial','Port',Port);
deleteSerial(Serial);

Serial = serial(Port);
Param = getSerialParam;

Serial.BAUD = Param.BAUD;
Serial.DataBits = Param.DataBits;
Serial.StopBits = Param.StopBits;
Serial.Parity = Param.Parity;
Serial.ReadAsyncMode = Param.ReadAsyncMode;
Serial.Timeout = Param.Timeout;
Serial.InputBufferSize = Param.InputBufferSize;

try
    fopen(Serial);
catch exception
    handleExceptionFOPEN(Serial,exception);
end
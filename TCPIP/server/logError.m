function logError(Exception)

msgError = getReport(Exception);
time = datestr(now);
fid = fopen('error.log','a+');
fprintf(fid,'%s %s',time,msgError);
fclose(fid);
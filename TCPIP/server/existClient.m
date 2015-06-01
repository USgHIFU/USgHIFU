


function IsClientExisting = existClient(hFigure)

IsClientExisting = false;

if isempty(getappdata(hFigure,'client'))
    Client = newClient;
    if isempty(Client)
        return
    else
        setappdata(hFigure,'client',Client);
        IsClientExisting = true;
    end
else
    IsClientExisting = true;
end
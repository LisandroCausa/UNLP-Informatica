program dos;
var
    i       : integer;
    numero  : integer;
    maximo  : integer;
    indiceDelMaximo : integer;
begin
    maximo := -9999;
    for i:= 1 to 10 do
    begin
        readln(numero);
        if(numero >= maximo) then
        begin
            maximo := numero;
            indiceDelMaximo := i;
        end;
    end;
    writeln('El mayor número leido fue el ', maximo, ' en la posición ', indiceDelMaximo);
end.
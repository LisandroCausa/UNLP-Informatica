program practica1_9;
var
    operacion :  char;
    entrada : integer;
    total   : integer;
begin
    total := 0;
    readln(operacion);
    if(operacion = '+') then
    begin
        read(entrada);
        while(entrada <> 0) do
        begin
            total := total + entrada;
            read(entrada);
        end;
        writeln('Resultado = ', total);
    end
    else if(operacion = '-') then
    begin
        read(entrada);
        while(entrada <> 0) do
        begin
            total := total - entrada;
            read(entrada);
        end;
        writeln('Resultado = ', total);
    end;
end.
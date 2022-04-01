program cuatro;
var
    min1: integer;
    min2: integer;
    numero  : integer;
begin
    min1 := 9999;
    min2 := 9999;
    readln(numero);
    while(numero <> 0) do
    begin
        if(numero < min1) then
        begin
            min2 := min1;
            min1 := numero;
        end
        else if(numero < min2) then
            min2 := numero;
        readln(numero);
    end;
    writeln('minimo: ', min1);
    writeln('segundo minimo: ', min2);
end.
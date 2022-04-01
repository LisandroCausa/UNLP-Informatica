program cuatro;
var
    min1: integer;
    min2: integer;
    numero  : integer;
begin
    min1 := 9999;
    min2 := 9999;
    repeat
        readln(numero);
        if(numero < min1) then
        begin
            min2 := min1;
            min1 := numero;
        end
        else if(numero < min2) then
            min2 := numero;
    until(numero = 0);
    writeln('minimo: ', min1);
    writeln('segundo minimo: ', min2);
end.
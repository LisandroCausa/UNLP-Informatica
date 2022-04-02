program cinco;
var
    max         : integer;
    min         : integer;
    numero      : integer;
    sumaTotal   : integer;
begin
    max := -9999;
    min := 9999;
    sumaTotal := 0;
    repeat
        readln(numero);
        sumaTotal := sumaTotal + numero;
        if(numero > max) then
            max := numero;
        if(numero < min) then
            min := numero;
    until(numero = 100);
    writeln('maximo: ', max);
    writeln('minimo: ', min);
    writeln('suma total: ', sumaTotal);
end.
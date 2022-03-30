program uno;
var
    numero  : integer;
    i       : integer;
    sumaTotal   : integer;
    mayoresQue5 : integer;
begin
    mayoresQue5 := 0;
    sumaTotal := 0;
    for i:= 1 to 10 do
    begin
        readln(numero);
        sumaTotal := sumaTotal + numero;
        if(numero > 5) then
            mayoresQue5 := mayoresQue5 + 1;
    end;
    writeln('suma total: ', sumaTotal);
    writeln('mayores que 5: ', mayoresQue5);
end.
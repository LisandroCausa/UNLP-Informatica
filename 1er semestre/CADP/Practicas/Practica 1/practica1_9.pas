program practica1_9;
var
    operacion   : char;
    entrada     : integer;
    valorInicial: integer;
    total       : integer;
begin
    total := 0;
    readln(operacion);
    if((operacion = '+') or (operacion = '-')) then
    begin
        readln(valorInicial);
        if(valorInicial <> 0) then
        begin
            total := valorInicial;
            readln(entrada);
            if(operacion = '+') then
            begin
                while(entrada <> 0) do
                begin
                    total := total + entrada;
                    readln(entrada);
                end;
            end
            else if(operacion = '-') then
            begin
                while(entrada <> 0) do
                begin
                    total := total - entrada;
                    readln(entrada);
                end;
            end;
        end;
        writeln('Resultado = ', total);
    end;
end.
program seis;
type
    codigo = 1..200;
var
    id      : codigo;
    precio  : integer;
    i       : integer;
    idMasBarato1 : codigo;
    idMasBarato2 : codigo;
    productosEspeciales : integer;
    min1 : integer;
    min2 : integer;
begin
    min1 := 9999;
    min2 := 9999;
    productosEspeciales := 0;
    for i:=1 to 200 do
    begin
        write('ID: ');
        readln(id);
        write('PRECIO: $');
        readln(precio);
        writeln('-----------------------------');
        if(precio < min1) then
        begin
            min2 := min1;
            min1 := precio;
            idMasBarato2 := idMasBarato1;
            idMasBarato1 := id;
        end
        else if(precio < min2) then
        begin
            min2 := precio;
            idMasBarato2 := id;
        end;

        if((precio > 16) and (id MOD 2 = 0)) then
            productosEspeciales := productosEspeciales + 1;
    end;
    writeln('ID primer producto más barato: ', idMasBarato1);
    writeln('ID segundo producto más barato: ', idMasBarato2);
    writeln('Cantidad de productos de costo mayor a $16 y codigo par: ', productosEspeciales);
end.
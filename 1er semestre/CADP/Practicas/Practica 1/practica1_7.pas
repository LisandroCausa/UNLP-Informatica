program practica1_7;
const
    porcentajeSupero = 10;
var
    id : integer;
    precioActual: integer;
    precioNuevo : integer;
    porcentajeAumento : real;
    aumentoSuperaPorcentaje : boolean;
begin
    repeat
    begin
        readln(id);
        readln(precioActual);
        readln(precioNuevo);
        porcentajeAumento := ((precioNuevo-precioActual)*100) / precioActual;
        aumentoSuperaPorcentaje := porcentajeAumento > porcentajeSupero;
        write('el aumento de precio del producto ', id);
        if(aumentoSuperaPorcentaje) then
            writeln(' es superior al ', porcentajeSupero, '%')
        else
            writeln(' no supera el ', porcentajeSupero, '%');
    end
    until(id = 32767);
end.
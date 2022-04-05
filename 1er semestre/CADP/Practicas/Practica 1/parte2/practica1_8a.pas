program ocho;
var
	monto			: integer;
	i				: integer;
	cantVentas		: integer;
	montoTotalMes	: integer;
    
    max     : integer;
    diaMax  : integer;
begin
    max := -1;
	montoTotalMes := 0;
	for i:= 1 to 31 do
	begin
		cantVentas := 0;
		writeln('DIA ', i);
		write('Monto: $');
		readln(monto);
		while(monto <> 0) do
		begin
			cantVentas := cantVentas + 1;
			montoTotalMes := montoTotalMes + monto;
			write('Monto: $');
			readln(monto);
		end;
        if(cantVentas > max) then
        begin
            max := cantVentas;
            diaMax := i;
        end;
		writeln('Cantidad de ventas hoy: ', cantVentas);
		writeln('----------------------------------------');
	end;
	writeln('Monto total de las ventas del mes: ', montoTotalMes);
    writeln('El día ', diaMax,' fue el que tuvo mayor cantidad de compras');
end.
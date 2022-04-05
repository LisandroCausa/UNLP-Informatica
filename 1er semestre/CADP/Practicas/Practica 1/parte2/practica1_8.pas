program ocho;
var
	monto			: integer;
	i				: integer;
	cantVentas		: integer;
	montoTotalMes	: integer;
begin
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
		writeln('Cantidad de ventas hoy: ', cantVentas);
		writeln('----------------------------------------');
	end;
	writeln('Monto total de las ventas del mes: ', montoTotalMes);
end.
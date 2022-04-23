program cinco;
type
	t_auto = record
		marca : string;
		modelo : string;
		precio : integer;
	end;

procedure leerAuto(var auto : t_auto);
begin
	write('Marca: ');
	readln(auto.marca);
	write('Modelo: ');
	readln(auto.modelo);
	write('Precio: $');
	readln(auto.precio);
	writeln;
end;

var
	auto : t_auto;
	marcaActual : string;
	cantAutosMarca : integer;
	sumaPreciosMarca : integer;

	autoMasCaro : t_auto;
begin
	autoMasCaro.precio := -1;
	leerAuto(auto);
	cantAutosMarca := 0;
	sumaPreciosMarca := 0;
	marcaActual := auto.marca;
	while(auto.marca <> 'ZZZ') do
	begin
		if(auto.marca <> marcaActual) then
		begin
			writeln('Precio promedio marca ', marcaActual, ': ', sumaPreciosMarca / cantAutosMarca);
			cantAutosMarca := 0;
			sumaPreciosMarca := 0;
			marcaActual := auto.marca;
		end;
		cantAutosMarca := cantAutosMarca + 1;
		sumaPreciosMarca := sumaPreciosMarca + auto.precio;
		if(auto.precio >= autoMasCaro.precio) then
		begin
			autoMasCaro.precio := auto.precio;
			autoMasCaro.marca := auto.marca;
			autoMasCaro.modelo := auto.modelo;
		end;
		leerAuto(auto);
	end;
	if(cantAutosMarca > 0) then
	begin
		writeln('Precio promedio marca ', marcaActual, ': ', sumaPreciosMarca / cantAutosMarca);
		writeln('El auto mas caro fue: ', autoMasCaro.marca, ' ', autoMasCaro.modelo);
	end;
end.
program ocho;

procedure leerDatos(var precio : integer; var codigo : integer; var tipo : string);
begin
	write('Precio: ');
	readln(precio);

	write('Codigo: ');
	readln(codigo);

	write('Tipo: ');
	readln(tipo);
	
	writeln('------------------');
end;

procedure actualizarProdMasBaratos(precio, codigo : integer; var precioMasBarato1, codigoMasBarato1 : integer; var precioMasBarato2, codigoMasBarato2 : integer);
begin
	if(precio <= precioMasBarato1) then
	begin
		precioMasBarato2 := precioMasBarato1;
		precioMasBarato1 := precio;

		codigoMasBarato2 := codigoMasBarato1;
		codigoMasBarato1 := codigo;
	end
	else if(precio <= precioMasBarato2) then
	begin
		precioMasBarato2 := precio;
		codigoMasBarato2 := codigo;
	end;
end;

procedure actualizarPantalonMasCaro(precio, codigo : integer; tipo : string; var precioPantalonMasCaro, codigoPantalonMasCaro : integer);
begin
	if((tipo = 'pantalon') and (precio >= precioPantalonMasCaro)) then
	begin
		precioPantalonMasCaro := precio;
		codigoPantalonMasCaro := codigo;
	end;
end;

const
	cantProductos = 100;
var
	precioEntrada : integer;
	codigoEntrada : integer;
	tipoEntrada   : string;

	precioMasBarato1 : integer;
	codigoMasBarato1 : integer;
	precioMasBarato2 : integer;
	codigoMasBarato2 : integer;

	precioPantalonMasCaro : integer;
	codigoPantalonMasCaro : integer;

	sumaPrecios : integer;
	precioPromedio : real;
	i : integer;

begin // INICIA EL PROGRAMA PRINCIPAL
	precioMasBarato1 := 9999;
	precioMasBarato2 := 9999;
	precioPantalonMasCaro := 0;
	sumaPrecios := 0;
	for i:=1 to cantProductos do
	begin
		leerDatos(precioEntrada, codigoEntrada, tipoEntrada);
		actualizarProdMasBaratos(precioEntrada, codigoEntrada, precioMasBarato1, codigoMasBarato1, precioMasBarato2, codigoMasBarato2);
		actualizarPantalonMasCaro(precioEntrada, codigoEntrada, tipoEntrada, precioPantalonMasCaro, codigoPantalonMasCaro);
		sumaPrecios := sumaPrecios + precioEntrada;
	end;
	writeln('Codigo de los productos mas baratos: ', codigoMasBarato1, ' ', codigoMasBarato2);
	writeln('Codigo pantalon mas caro: ', codigoPantalonMasCaro);
	precioPromedio := sumaPrecios / cantProductos;
	writeln('Precio promedio: ', precioPromedio);
end.
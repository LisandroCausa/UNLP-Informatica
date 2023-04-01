program practica2_3;
const
	N = 30; // número de archivos detalle
	VALOR_ALTO = 9999;
type
	str32 = string[32];
	str64 = string[64];
	t_producto = record
		codigo : integer;
		nombre : str32;
		descripcion : str64;
		stockDisponible : integer;
		stockMinimo : integer;
		precio : integer;
	end;
	t_prod_detalle = record
		codigo : integer;
		cantVendida : integer;
	end;
	t_vector_prod_detalles = array[1..N] of t_prod_detalle;
	t_vector_text = array[1..N] of text;
	t_archivo = file of t_producto;

procedure leerMaestro(var archivo : t_archivo; var dato : t_producto);
begin
	if(not EOF(archivo)) then
		read(archivo, dato)
	else
		dato.codigo := VALOR_ALTO;
end;

procedure leerDetalle(var archivo : text; var dato : t_prod_detalle);
begin
	if(not EOF(archivo)) then
		readln(archivo, dato.codigo, dato.cantVendida)
	else
		dato.codigo := VALOR_ALTO;
end;

function indiceMinimo(vector : t_vector_prod_detalles) : integer;
var
	i : integer;
	minimo : integer;
	indice : integer;
begin
	minimo := VALOR_ALTO;
	indice := 1;
	for i:=1 to N do
	begin
		if(vector[i].codigo < minimo) then
		begin
			indice := i;
			minimo := vector[indice].codigo;
		end;
	end;
	indiceMinimo := indice;
end;

procedure actualizarStock(nombreArchivoMaestro : str32; var detalles : t_vector_text);
var
	maestro : t_archivo;
	productosDetalle : t_vector_prod_detalles;
	i : integer;
	regMaestro : t_producto;
	regDetalle : t_prod_detalle;
	detalleMinimo : integer;
begin
	assign(maestro, nombreArchivoMaestro);
	for i:=1 to N do
	begin
		reset(detalles[i]);
		leerDetalle(detalles[i], productosDetalle[i]);
	end;
	reset(maestro);
	leerMaestro(maestro, regMaestro);
	detalleMinimo := indiceMinimo(productosDetalle);
	regDetalle := productosDetalle[detalleMinimo];
	leerDetalle(detalles[detalleMinimo], productosDetalle[detalleMinimo]);
	while(regDetalle.codigo <> VALOR_ALTO) do
	begin
		while(regDetalle.codigo <> regMaestro.codigo) do
			leerMaestro(maestro, regMaestro);
		
		regMaestro.stockDisponible := regMaestro.stockDisponible - regDetalle.cantVendida;

		seek(maestro, filePos(maestro)-1);
		write(maestro, regMaestro);

		detalleMinimo := indiceMinimo(productosDetalle);
		regDetalle := productosDetalle[detalleMinimo];
		leerDetalle(detalles[detalleMinimo], productosDetalle[detalleMinimo]);
	end;
	close(maestro);
	for i:=1 to N do
		close(detalles[i]);
end;

procedure cargarProducto(var prod : t_producto);
begin
	write('Codigo: ');
	readln(prod.codigo);
	if(prod.codigo <> -1) then
	begin
		write('Nombre: ');
		readln(prod.nombre);
		write('Descripcion: ');
		readln(prod.descripcion);
		write('Stock Disponible: ');
		readln(prod.stockDisponible);
		write('Stock Minimo: ');
		readln(prod.stockMinimo);
		write('Precio: $');
		readln(prod.precio);
	end;
	writeln;
end;

procedure generarMaestro(nombreArchivoMaestro : str32);
var
	archivo : t_archivo;
	entrada : t_producto;
begin
	assign(archivo, nombreArchivoMaestro);
	rewrite(archivo);
	cargarProducto(entrada);
	while(entrada.codigo <> -1) do
	begin
		write(archivo, entrada);
		cargarProducto(entrada);
	end;
	close(archivo);
end;

procedure imprimirProducto(prod : t_producto);
begin
	writeln('Codigo: ', prod.codigo);
	writeln('Nombre: ', prod.nombre);
	writeln('Descripcion: ', prod.descripcion);
	writeln('Stock Disponible: ', prod.stockDisponible);
	writeln('Stock Minimo: ', prod.stockMinimo);
	writeln('Precio: $', prod.precio);
	writeln;
end;

procedure imprimirMaestro(nombreArchivoMaestro : str32);
var
	archivo : t_archivo;
	entrada : t_producto;
begin
	writeln('MAESTRO: ');
	assign(archivo, nombreArchivoMaestro);
	reset(archivo);
	leerMaestro(archivo, entrada);
	while(entrada.codigo <> VALOR_ALTO) do
	begin
		imprimirProducto(entrada);
		leerMaestro(archivo, entrada);
	end;
	close(archivo);
end;

procedure informarFaltosDeStock(nombreArchivoMaestro, nombreArchivoResultado : str32);
var
	maestro : t_archivo;
	resultado : text;
	entrada : t_producto;
begin
	assign(maestro, nombreArchivoMaestro);
	assign(resultado, nombreArchivoResultado);
	reset(maestro);
	rewrite(resultado);
	leerMaestro(maestro, entrada);
	while(entrada.codigo <> VALOR_ALTO) do
	begin
		if(entrada.stockDisponible < entrada.stockMinimo) then
		begin
			writeln(resultado, entrada.nombre);
			writeln(resultado, entrada.descripcion);
			writeln(resultado, 'Stock: ', entrada.stockDisponible);
			writeln(resultado, '$', entrada.precio);
		end;
		leerMaestro(maestro, entrada);
	end;
	close(maestro);
	close(resultado);
end;


// PROGRAMA PRINCIPAL
var
	detalles : t_vector_text;
	i : integer;
	iString : string;
	nombreArchivoMaestro : str32;
begin
	nombreArchivoMaestro := 'ej3_maestro.dat';
	for i:=1 to N do
	begin
		str(i, iString);
		assign(detalles[i], 'ej3_detalle'+iString+'.txt');
	end;
	generarMaestro(nombreArchivoMaestro);
	imprimirMaestro(nombreArchivoMaestro);
	actualizarStock(nombreArchivoMaestro, detalles);
	imprimirMaestro(nombreArchivoMaestro);
	informarFaltosDeStock(nombreArchivoMaestro, 'ej3_FaltosDeStock.txt');
end.
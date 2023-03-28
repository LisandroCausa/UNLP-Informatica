program practica1_5;
type
	str16 = string[16];
	str64 = string[64];
	t_celular = record
		codigo : integer;
		nombre : str16;
		descripcion : str64;
		marca : str16;
		precio : integer;
		stockMinimo : integer;
		stockDisponible : integer;
	end;
	t_archivo = file of t_celular;

procedure importarArchivo(var destino : t_archivo);
var
	fuente : text;
	entrada : t_celular;
begin
	assign(fuente, 'celulares.txt');
	reset(fuente);
	rewrite(destino);
	while(not eof(fuente)) do
	begin
		readln(fuente, entrada.codigo, entrada.precio, entrada.marca);
		readln(fuente, entrada.stockDisponible, entrada.stockMinimo, entrada.descripcion);
		readln(fuente, entrada.nombre);
		write(destino, entrada);
	end;
	close(fuente);
	close(destino);
end;

procedure leerCelular(var c : t_celular);
begin
	write('Codigo: ');
	readln(c.codigo);
	if(c.codigo <> -1) then
	begin
		write('Nombre: ');
		readln(c.nombre);
		write('Marca: ');
		readln(c.marca);
		write('Descripción: ');
		readln(c.descripcion);
		write('Precio: $');
		readln(c.precio);
		write('Stock minimo: ');
		readln(c.stockMinimo);
		write('Stock disponible: ');
		readln(c.stockDisponible);
	end;
	writeln;
end;

procedure imprimirCelular(c : t_celular);
begin
	writeln(c.nombre, ' ', c.marca, ' #', c.codigo);
	writeln('$', c.precio);
	writeln(c.descripcion);
	writeln('Stock minimo: ', c.stockMinimo);
	writeln('Stock actual: ', c.stockDisponible);
	writeln;
end;

procedure imprimirSinStock(var fuente : t_archivo);
var
	entrada : t_celular;
begin
	reset(fuente);
	while(not eof(fuente)) do
	begin
		read(fuente, entrada);
		if(entrada.stockDisponible < entrada.stockMinimo) then
			imprimirCelular(entrada);
	end;
	close(fuente);
end;

procedure imprimirConDescripcion(var fuente : t_archivo; descripcion : str64);
var
	entrada : t_celular;
begin
	reset(fuente);
	while(not eof(fuente)) do
	begin
		read(fuente, entrada);
		if(entrada.descripcion = descripcion) then
			imprimirCelular(entrada);
	end;
	close(fuente);
end;

procedure escribirCelularATexto(celular : t_celular; var texto : text);
begin
	writeln(texto, celular.codigo, ' ', celular.precio, ' ', celular.marca);
	writeln(texto, celular.stockDisponible, ' ', celular.stockMinimo, ' ', celular.descripcion);
	writeln(texto, celular.nombre);
end;

procedure exportarArchivo(var fuente : t_archivo);
var
	destino : text;
	entrada : t_celular;
begin
	assign(destino, 'celulares.txt');
	rewrite(destino);
	reset(fuente);
	while(not eof(fuente)) do
	begin
		read(fuente, entrada);
		escribirCelularATexto(entrada, destino);
	end;
	close(fuente);
	close(destino);
end;

procedure agregarCelulares(var archivo : t_archivo);
var
	entrada : t_celular;
begin
	reset(archivo);
	seek(archivo, fileSize(archivo));
	leerCelular(entrada);
	while(entrada.codigo <> -1) do
	begin
		write(archivo, entrada);
		leerCelular(entrada);
	end;
	close(archivo);
end;

procedure modificarStockConCodigo(var archivo : t_archivo; nombreCelular : str16; nuevoStock : integer);
var
	entrada : t_celular;
	encontrado : boolean;
begin
	encontrado := false;
	reset(archivo);
	while((not eof(archivo)) and (encontrado = false)) do
	begin
		read(archivo, entrada);
		if(entrada.nombre = nombreCelular) then
		begin
			entrada.stockDisponible := nuevoStock;
			seek(archivo, filePos(archivo)-1);
			write(archivo, entrada);
			encontrado := true;
		end;
	end;
	close(archivo);
	if(encontrado = false) then
		writeln('CELULAR NO ENCONTRADO.');
end;

procedure exportarCelularesSinStock(var fuente : t_archivo; nombreDestino : str16);
var
	entrada : t_celular;
	destino : text;
begin
	assign(destino, nombreDestino);
	rewrite(destino);
	reset(fuente);
	while(not eof(fuente)) do
	begin
		read(fuente, entrada);
		if(entrada.stockDisponible = 0) then
			escribirCelularATexto(entrada, destino);
	end;
	close(fuente);
	close(destino);
end;

procedure obtenerNombreArchivo(var nombre : str16);
begin
	write('Nombre del archivo: ');
	readln(nombre);
end;

procedure imprimirMenu();
begin
	writeln('1) Importar archivo');
	writeln('2) Listar celulares sin stock suficiente');
	writeln('3) Listar celulares con determinada descripción');
	writeln('4) Exportar archivo');
	writeln('5) Añadir celulares por teclado');
	writeln('6) Modificar stock de un celular');
	writeln('7) Exportar listado de celulares sin stock');
	writeln;
end;

var
	archivo : t_archivo;
	nombreArchivo : str16;
	opcionElegida : integer;
	descripcionAux : str64;
	nombreAux : str16;
	stockAux : integer;
begin
	writeln(sizeof(t_celular));
	imprimirMenu();
	write(': ');
	readln(opcionElegida);
	obtenerNombreArchivo(nombreArchivo);
	assign(archivo, nombreArchivo);
	case opcionElegida of
		1: importarArchivo(archivo);
		2: imprimirSinStock(archivo);
		3: begin
			write('Descripción buscada: ');
			readln(descripcionAux);
			imprimirConDescripcion(archivo, descripcionAux);
		end;
		4: exportarArchivo(archivo);
		5: agregarCelulares(archivo);
		6: begin
			write('Nombre de celular buscado: ');
			readln(nombreAux);
			write('Nuevo Stock: ');
			readln(stockAux);
			modificarStockConCodigo(archivo, nombreAux, stockAux);
		end;
		7: exportarCelularesSinStock(archivo, 'SinStock.txt');
	end;
end.
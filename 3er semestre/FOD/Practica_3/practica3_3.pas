program practica3_3;
const
	VALOR_EOF = -9999;
type
	str32 = string[32];

	t_novela = record
		codigo : integer;
		genero : str32;
		nombre : str32;
		duracion : integer; // en minutos
		director : str32;
		precio : integer;
	end;

	t_archivo = file of t_novela;

procedure crearNovela(var novela : t_novela);
begin
	write('Codigo: ');
	readln(novela.codigo);
	if(novela.codigo > 0) then
	begin
		write('Genero: ');
		readln(novela.genero);
		write('Nombre: ');
		readln(novela.nombre);
		write('Duracion: ');
		readln(novela.duracion);
		write('Director: ');
		readln(novela.director);
		write('Precio: $');
		readln(novela.precio);
	end;
	writeln;
end;

procedure crearArchivo(nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_novela;
begin
	assign(archivo, nombreArchivo);
	rewrite(archivo);
	
	// crear cabecera de la lista
	entrada.codigo := 0;
	write(archivo, entrada);

	crearNovela(entrada);
	while(entrada.codigo > 0) do
	begin
		write(archivo, entrada);
		crearNovela(entrada);
	end;
	close(archivo);
end;

procedure leerNovela(var archivo : t_archivo; var novela : t_novela);
begin
	if(not EOF(archivo)) then
		read(archivo, novela)
	else
		novela.codigo := VALOR_EOF;
end;

procedure agregarNovela(novela : t_novela; nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_novela;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);
	read(archivo, entrada);
	if(entrada.codigo = 0) then
	begin
		// cabecera de lista nula
		// se debe agregar al final
		seek(archivo, fileSize(archivo));
		write(archivo, novela);
	end
	else // se encuentra el puntero en cabecera de lista
	begin
		// recuperar siguiente cabecera de lista
		seek(archivo, -(entrada.codigo));
		read(archivo, entrada);

		// escribir nueva novela en posicion correspondiente
		seek(archivo, filePos(archivo)-1);
		write(archivo, novela);

		// actualizar cabecera de lista
		reset(archivo);
		write(archivo, entrada);
	end;
	close(archivo);
end;

procedure actualizarNovela(actualizacion : t_novela; nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_novela;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);
	leerNovela(archivo, entrada);
	while((entrada.codigo <> actualizacion.codigo) and (entrada.codigo <> VALOR_EOF)) do
		leerNovela(archivo, entrada);

	if(entrada.codigo <> VALOR_EOF) then
	begin
		seek(archivo, filePos(archivo)-1);
		write(archivo, actualizacion);
	end;
	close(archivo);
end;

procedure eliminarNovela(codigoBuscado : integer; nombreArchivo : str32);
var
	archivo : t_archivo;
	entrada : t_novela;

	cabeceraCola : integer;
	nuevaPos : integer;
begin
	assign(archivo, nombreArchivo);
	reset(archivo);

	leerNovela(archivo, entrada);
	cabeceraCola := entrada.codigo;

	while((entrada.codigo <> codigoBuscado) and (entrada.codigo <> VALOR_EOF)) do
		leerNovela(archivo, entrada);

	// si encontró el elemento buscado
	if(entrada.codigo <> VALOR_EOF) then
	begin
		seek(archivo, filePos(archivo)-1); // volver para modificar el recien leido 
		nuevaPos := filePos(archivo); // guardar nueva posición
		
		entrada.codigo := cabeceraCola;
		write(archivo, entrada);

		// escribir en cabecera de lista
		reset(archivo);
		entrada.codigo := -(nuevaPos);
		write(archivo, entrada);
	end;
	close(archivo);
end;

procedure novelaATexto(novela : t_novela; var texto : text);
begin
	writeln(texto, 'Codigo: ', novela.codigo);
	writeln(texto, 'Genero: ', novela.genero);
	writeln(texto, 'Nombre: ', novela.nombre);
	writeln(texto, 'Duracion: ', novela.duracion, ' minutos');
	writeln(texto, 'Director: ', novela.director);
	writeln(texto, 'Precio: $', novela.precio);
	writeln(texto);
end;

procedure exportarTexto(nombreArchivo : str32);
var
	fuente : t_archivo;
	destino : text;
	entrada : t_novela;
begin
	assign(fuente, nombreArchivo);
	assign(destino, 'novelas.txt');

	reset(fuente);
	rewrite(destino);

	leerNovela(fuente, entrada);
	while(entrada.codigo <> VALOR_EOF) do
	begin
		novelaATexto(entrada, destino);	
		leerNovela(fuente, entrada);
	end;
	close(fuente);
	close(destino);
end;

const
	nombreArchivo = 'ej3_archivo.dat';
var
	aux : t_novela;
begin
	//crearArchivo(nombreArchivo);
	writeln('-----------------------------------------');

	crearNovela(aux);
	agregarNovela(aux, nombreArchivo);

	crearNovela(aux);
	actualizarNovela(aux, nombreArchivo);

	write('Ingrese el codigo de la novela a eliminar: ');
	readln(aux.codigo);
	eliminarNovela(aux.codigo, nombreArchivo);

	exportarTexto(nombreArchivo);
end.
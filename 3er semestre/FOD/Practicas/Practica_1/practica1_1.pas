program practica1_1;
type
	t_archivo = file of integer;
var
	archivo : t_archivo;
	nombreArchivo : string[12];
	entrada : integer;
begin
	write('Nombre de archivo: ');
	readln(nombreArchivo);
	assign(archivo, nombreArchivo);
	rewrite(archivo);
	readln(entrada);
	while entrada <> 30000 do
	begin
		write(archivo, entrada);
		readln(entrada);
	end;
	close(archivo);
end.
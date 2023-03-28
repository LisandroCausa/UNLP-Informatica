program practica1_2;
type
	t_archivo = file of integer;
var
	archivo : t_archivo;
	nombreArchivo : string[12];
	salida : integer;
	suma : integer;
	length : integer;
	promedio : real;
	cantMenor1500 : integer;
begin
	suma := 0;
	length := 0;
	cantMenor1500 := 0;
	write('Nombre de archivo: ');
	readln(nombreArchivo);
	assign(archivo, nombreArchivo);
	reset(archivo);
	while not eof(archivo) do
	begin
		read(archivo, salida);
		length := length + 1;
		suma := suma + salida;
		if salida < 1500 then
			cantMenor1500 := cantMenor1500 + 1;
		write(salida, ' ');
	end;
	close(archivo);
	promedio := suma / length;
	writeln;
	writeln('Cantidad de numeros menores a 1500: ', cantMenor1500);
	writeln('Promedio: ', promedio);
end.
program cuatro;
type
	t_lineaTelefonica = record
		numero : string;
		minutos : integer;
		MB : integer;
	end;

	t_cliente = record
		ID              : integer;
		cantLineas      : integer;
		minutosTotales  : integer;
		MBTotales       : integer;
	end;

procedure leerLinea(var linea : t_lineaTelefonica);
begin
	writeln;
	write('Numero: ');
	readln(linea.numero);
	
	write('Minutos consumidos: ');
	readln(linea.minutos);

	write('MB consumidos: ');
	readln(linea.MB);
end;

procedure leerCliente(var cliente : t_cliente);
var
	i : integer;
	lineaTelefonica : t_lineaTelefonica;
begin
	writeln('-----------------');
	write('ID: ');
	readln(cliente.ID);
	write('Cantidad de lineas: ');
	readln(cliente.cantLineas);
	cliente.minutosTotales := 0;
	cliente.MBTotales := 0;
	for i:= 1 to cliente.cantLineas do
	begin
		leerLinea(lineaTelefonica);
		cliente.minutosTotales := cliente.minutosTotales + lineaTelefonica.minutos;
		cliente.MBTotales := cliente.MBTotales + lineaTelefonica.MB;
	end;
end;

const
	CLIENTES = 9300;

	COSTO_MINUTO = 3.40;
	COSTO_MB = 1.35;
var
	i : integer;
	entrada : t_cliente;
begin
	for i:= 1 to CLIENTES do
	begin
		leerCliente(entrada);
		writeln;
		writeln('Minutos: ', entrada.minutosTotales);
		writeln('MB: ', entrada.MBTotales);
		writeln('Monto total a facturar: ', (entrada.minutosTotales * COSTO_MINUTO) + (entrada.MBTotales * COSTO_MB));
	end;
end.
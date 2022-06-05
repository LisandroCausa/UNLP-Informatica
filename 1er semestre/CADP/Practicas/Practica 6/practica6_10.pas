program diez;
type
	t_cliente = record
		dni : string;
		numero : integer;
	end;
	lista = ^nodo; // A)
	nodo = record
		cliente : t_cliente;
		sig : lista;
	end;

// B)
procedure recibirCliente(dni : string; var L : lista);
var
	aux : lista;
	ultimoNumero : integer;
begin
	if(L = nil) then
	begin
		new(L);
		aux := L;
		L^.sig := nil;
	end
	else
	begin
		aux := L;
		ultimoNumero := L^.cliente.numero;
		while(aux^.sig <> nil) do
		begin
			aux := aux^.sig;
			ultimoNumero := aux^.cliente.numero;
		end;
		new(aux^.sig);
		aux := aux^.sig;
		aux^.cliente.numero := ultimoNumero;
	end;
	aux^.cliente.dni := dni;
	aux^.sig := nil;
end;

procedure atenderCliente(var L : lista; var numero : integer; var dni : string);
begin
	if(L <> nil) then
	begin
		numero := L^.cliente.numero;
		dni := L^.cliente.dni;
		L := L^.sig;
	end;
end;

procedure cargarCliente(var L : lista);
var
	dni : string;
begin
	readln(dni);
	while(dni <> '0') do
	begin
		recibirCliente(dni, L);
		readln(dni);
	end;
end;

var
	L : lista;
	dni : string;
	numero : integer;
begin
	cargarCliente(L);
	while(L <> nil) do
	begin
		atenderCliente(L, numero, dni);
		// Hace algo con los datos que devuelve
	end;
end.
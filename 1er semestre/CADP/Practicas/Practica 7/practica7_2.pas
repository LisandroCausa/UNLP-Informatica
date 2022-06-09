program dos;
type
	t_poliza = 1..6;
	t_cliente = record
		codigo : integer;
		dni : longint;
		apellido : string;
		nombre : string;
		poliza : t_poliza;
		montoBasico : real;
	end;
	lista = ^nodo;
	nodo = record
		cliente : t_cliente;
		sig : lista;
	end;

	adicional_lista = ^adicional_nodo;
	adicional_nodo = record
		monto : real;
		sig : adicional_lista;
	end;

procedure agregarAdelante(c : t_cliente; var L : lista);
var
	aux : lista;
begin
	new(aux);
	aux^.cliente := c;
	aux^.sig := L;
	L := aux;
end;

procedure leerCliente(var c : t_cliente);
begin
	write('Codigo de cliente: ');
	readln(c.codigo);
	
	write('DNI: ');
	readln(c.dni);

	write('Apellido: ');
	readln(c.apellido);

	write('Nombre: ');
	readln(c.nombre);

	write('Codigo de poliza: ');
	readln(c.poliza);

	write('Monto basico: $');
	readln(c.montoBasico);
	writeln;
end;

procedure cargarLista(var L : lista);
var
	cliente : t_cliente;
begin
	repeat
		leerCliente(cliente);
		agregarAdelante(cliente, L);
	until(cliente.codigo = 1122);
end;

function digitos9(num : longint) : integer;
var
	cant : integer;
	aux : longint;
begin
	cant := 0;
	while(num <> 0) do
	begin
		aux := num MOD 10;
		if(aux = 9) then
			cant := cant + 1;
		num := num DIV 10;
	end;
	digitos9 := cant;
end;

// C)
procedure buscarEliminar(codigo : integer; var L : lista);
var
	encontro : boolean;
	aux : lista;
	tmp : lista;
begin
	if(L <> nil) then
	begin
		aux := L;
		if(L^.cliente.codigo = codigo) then
		begin
			L := L^.sig;
			dispose(aux);
		end
		else
		begin
			encontro := false;
			while((NOT(encontro)) AND (aux^.sig <> nil)) do
			begin
				if(aux^.sig^.cliente.codigo = codigo) then
				begin
					encontro := true;
					tmp := aux^.sig;
					aux^.sig := tmp^.sig;
					dispose(tmp);
				end;
				aux := aux^.sig;
			end;
		end;
	end;
end;


var
	L : lista;
	M : adicional_lista;
begin
	cargarLista(L);
	buscarEliminar(123, L);
	writeln;
	while(L <> nil) do
	begin
		if(M <> nil) then
		begin
			writeln(L^.cliente.dni, ' ', L^.cliente.apellido, ' ', L^.cliente.nombre, ' $', (L^.cliente.montoBasico + M^.monto):6:2);
			M := M^.sig;
		end;
		if(digitos9(L^.cliente.dni) >= 2) then
			writeln(L^.cliente.apellido, ' ', L^.cliente.nombre);
		L := L^.sig;
	end;
end.
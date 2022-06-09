program nueve;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

// A)
function estaOrdenada(L : lista) : boolean;
var
	aux : integer;
begin
	if(L <> nil) then
	begin
		aux := L^.num;
		L := L^.sig;
		while(L <> nil) do
		begin
			if(L^.num < aux) then
				estaOrdenada := false;
			aux := L^.num;
			L := L^.sig;
		end;
	end;
	estaOrdenada := true;
end;

// B)
procedure eliminar(L : lista; valor : integer);
var
	aux : lista;
	elimino : boolean;
begin
	elimino := false;
	aux := L;
	while((L <> nil) AND (elimino = false)) do
	begin
		if(L^.num = valor) then
		begin
			aux^.sig := L^.sig;
			elimino := true;
		end;
		aux := L;
		L := L^.sig;
	end;
end;

// C)
procedure sublista(L : lista; a : integer; b : integer; var nueva : lista);
var
	aux : lista;
	tieneElem : boolean;
begin
	tieneElem := false;
	while(L <> nil) do
	begin
		if((L^.num > a) AND (L^.num < b)) then
		begin
			if(NOT(tieneElem)) then
			begin
				new(aux);
				nueva := aux;
				tieneElem := true;
			end
			else
			begin
				new(aux^.sig);
				aux := aux^.sig;
			end;
			aux^.num := L^.num;
			aux^.sig := nil;
		end;
		L := L^.sig;
	end;
end;

// D) lista L se encuentra ordenada de manera ascendente
procedure sublistaD(L : lista; a : integer; b : integer; var nueva : lista);
var
	aux : lista;
	tieneElem : boolean;
begin
	tieneElem := false;
	while((L <> nil) AND (L^.num < b)) do
	begin
		if((L^.num > a) AND (L^.num < b)) then
		begin
			if(NOT(tieneElem)) then
			begin
				new(aux);
				nueva := aux;
				tieneElem := true;
			end
			else
			begin
				new(aux^.sig);
				aux := aux^.sig;
			end;
			aux^.num := L^.num;
			aux^.sig := nil;
		end;
		L := L^.sig;
	end;
end;

// E) lista L se encuentra ordenada de manera descendente
procedure sublistaE(L : lista; a : integer; b : integer; var nueva : lista);
var
	aux : lista;
	tieneElem : boolean;
begin
	tieneElem := false;
	while((L <> nil) AND (L^.num > a)) do
	begin
		if((L^.num > a) AND (L^.num < b)) then
		begin
			if(NOT(tieneElem)) then
			begin
				new(aux);
				nueva := aux;
				tieneElem := true;
			end
			else
			begin
				new(aux^.sig);
				aux := aux^.sig;
			end;
			aux^.num := L^.num;
			aux^.sig := nil;
		end;
		L := L^.sig;
	end;
end;

begin
end.
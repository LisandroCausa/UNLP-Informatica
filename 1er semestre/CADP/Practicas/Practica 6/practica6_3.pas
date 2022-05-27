// A)
procedure armarNodo(var L : lista; v : integer);
var
	aux : lista;
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.num := v;
	nuevo^.sig := nil;
	if(L = nil) then
	begin
		L := nuevo;
	end
	else
	begin
		aux := L;
		while(aux^.sig <> nil) do
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

////////////////////////////////////////////////////

// B)
procedure armarNodo(var ultimo : lista; v : integer);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.num := v;
	nuevo^.sig := nil;
	if(ultimo = nil) then
	begin
		ultimo := nuevo;
	end
	else
	begin
		while(ultimo^.sig <> nil) do
			ultimo := ultimo^.sig;
		ultimo^.sig := nuevo;
		ultimo := ultimo^.sig;
	end;
end;
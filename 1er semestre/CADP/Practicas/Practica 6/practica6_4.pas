program cuatro;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

// A)
procedure max(L : lista; var max : lista);
begin
	max := L;
	while(L <> nil) do
	begin
		if(L^.num > max^.num) then
			max := L;
		L := L^.sig;
	end;
end;


// B)
procedure min(L : lista; var min : lista);
begin
	min := L;
	while(L <> nil) do
	begin
		if(L^.num < min^.num) then
			min := L;
		L := L^.sig;
	end;
end;

// C)
function multiplosDe(valor : integer; L : lista) : integer;
var
	cont : integer;
begin
	cont := 0;
	while(L <> nil) do
	begin
		if(L^.num MOD valor = 0) then
			cont := cont + 1;
		L := L^.sig;
	end;
	multiplosDe := cont;
end;

begin
end.
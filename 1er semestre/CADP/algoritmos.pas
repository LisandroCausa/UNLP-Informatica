program algoritmos; // https://www.youtube.com/watch?v=b4dM83EpQks
const
	N = 100;
type
	vector = array[1..N] of integer;
	lista = ^nodo;
	nodo = record
		valor : integer;
		sig : lista;
	end;
//////////////////////////////////////////////////////////

procedure corteDeControl();
var
	entrada : string;
	actual : string;
	cant : integer;
begin
	readln(entrada);
	while(entrada <> 'fin') do
	begin
		actual := entrada;
		cant := 0;
		while(entrada = actual) do
		begin
			cant := cant + 1; // hacer algo
			readln(entrada);
		end;
		// hacer otro algo
	end;
end;

procedure procesarDigitos(num : integer);
var
	digito : integer;
begin
	while(num <> 0) do
	begin
		digito := num MOD 10;
		// procesar digito
		num := num DIV 10;
	end;

end;

procedure hallar2Maximos(v : vector; var max1, max2 : integer);
var
	i : integer;
begin
	max1 := -1;
	max2 := -1;
	for i:=1 to N do
	begin
		if(v[i] >= max1) then
		begin
			max2 := max1;
			max1 := v[i];
		end
		else if(v[i] >= max2) then
		begin
			max2 := v[i];
		end;
	end;
end;

procedure cargarVector(var v : vector; var dimL : integer);
var
	entrada : integer;
begin
	dimL := 0;
	readln(entrada);
	while((entrada <> -1) and (dimL < N)) do
	begin
		dimL := dimL + 1;
		v[dimL] := entrada;
		readln(entrada);
	end;
end;

function existeValor(v : vector; num : integer) : boolean;
var
	i : integer;
	existe : boolean;
begin
	existe := false;
	i := 1;
	repeat
		if(v[i] = num) then
			existe := true;
		i := i + 1;
	until((existe) OR (i > N));
	existeValor := existe;
end;

function existeValorOrdenado(v : vector; num : integer) : boolean;
var
	i : integer;
	existe : boolean;
begin
	existe := false;
	i := 1;
	repeat
		if(v[i] = num) then
			existe := true;
		i := i + 1;
	until((existe) OR (i > N) OR (v[i] > num));
	existeValorOrdenado := existe;
end;

procedure remover(indice:integer; var v:vector; var dimL:integer);
var
	i : integer;
begin
	if((indice >= 1) and (indice <= dimL)) then
	begin
		dimL := dimL - 1;
		for i:=indice to dimL do
			v[i] := v[i+1];
	end;
end;

procedure insertar(valor : integer; indice : integer; var v:vector; var dimL:integer);
var
	i : integer;
begin
	if((dimL < N) and (indice >= 1) and (indice <= dimL)) then
	begin
		dimL := dimL + 1;
		for i:=dimL downto indice+1 do
			v[i] := v[i-1];
		v[indice] := valor;
	end;
end;

procedure agregar(valor : integer; var v:vector; var dimL:integer);
begin
	if(dimL < N) then
	begin
		dimL := dimL + 1;
		v[dimL] := valor;
	end;
end;

// https://github.com/Kelisei/UNLP-INFORMATICA-personal/blob/main/CADP/algoritmos.pas
function busquedaBinaria(x : integer; v : vector; dimL: integer) : boolean;
var
	pri : integer;
	ult : integer;
	medio: integer;
	ok : boolean;
begin
	ok := false; // ok chequea si lo encontró
	pri := 1;
	ult := dimL;
	// mientras no se llegó al final y no se encontró el elemento
	while((pri <= ult) and (ok = false)) do
	begin
		medio := (pri+ult) DIV 2; // reseteamos el medio
		if(x = v[medio]) then
			ok := true
		else if(x < v[medio]) then
			ult := medio - 1
		else
			pri := medio + 1;
	end;
	busquedaBinaria := ok;
end;

////////// LISTAS /////////////////////
procedure agregarAdelante(valor : integer; var L : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.valor := valor;
	nuevo^.sig := L;
	L := nuevo;
end;

procedure agregarAtras(valor : integer; var L : lista; var ultimo : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.valor := valor;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ultimo^.sig := nuevo;

	ultimo := nuevo;
end;

procedure recorrerLista(L : lista);
begin
	while(L <> nil) do
	begin
		writeln(L^.valor); // hacer algo
		L := L^.sig;
	end;
end;

function busquedaOrdenada(X : integer; L : lista) : boolean;
begin
	while((L <> nil) and (X < L^.valor)) do
		L := L^.sig;

	if((L = nil) or (L^.valor <> X)) then
		busquedaOrdenada := false
	else
		busquedaOrdenada := true;
end;

// https://github.com/ZonaFabo/CADP
procedure insertarOrdenado(X : integer; var L : lista);
var 
	nuevo : lista;
	anterior : lista;
	actual : lista;
begin
	new(nuevo);
	nuevo^.valor := X;
	actual := L;
	anterior := L;
	// Recorro mientras no se termine la lista y no encuentro la posición correcta
	while((actual <> nil) and (actual^.valor < X)) do // De menor a mayor
	begin
		anterior := actual;
		actual := actual^.sig;
	end;
	if (anterior = actual)  then 
		L := nuevo   // el dato va al principio
	else
		anterior^.sig := nuevo; // va entre otros dos o al final
	nuevo^.sig := actual;
end;

// https://github.com/ZonaFabo/CADP
procedure removerElemento(X : integer; var L : lista; var existe: boolean);
var
	anterior : lista; 
	actual : lista;
begin 
	existe := false;
	actual := L;
	// recorro mientras no se termine la lista y no encuentre el elemento
	while((actual <> nil)  and (actual^.valor <> X)) do 
	begin
		anterior := actual;
		actual := actual^.sig;
	end;
	if (actual <> nil) then
	begin
		existe := true;
		if (actual = L) then
			L := actual^.sig
		else
			anterior^.sig := actual^.sig;
		dispose(actual);
	end;
end;

//////////////////////////////////////////////////////////
begin
end.
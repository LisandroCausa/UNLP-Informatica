program tres;
type
	t_viaje = record
		id : integer;
		auto : integer;
		origen : string;
		destino : string;
		km : real;
	end;
	lista = ^nodo;
	nodo = record
		viaje : t_viaje;
		sig : lista;
	end;

procedure actualizarMax(v : t_viaje; var max1, max2 : real; var maxCod1, maxCod2 : integer);
begin
	if(v.km >= max1) then
	begin
		max2 := max1;
		max1 := v.km;
		maxCod2 := maxCod1;
		maxCod1 := v.auto;
	end
	else if(v.km >= max2) then
	begin
		max2 := v.km;
		maxCod2 := v.auto;
	end;
end;

procedure insertarOrdenado(v : t_viaje; var L : lista);
var
	aux : lista;
	nuevo : lista;
	inserto : boolean;
begin
	new(nuevo);
	nuevo^.viaje := v;
	if(L = nil) then
	begin
		L := nuevo;
	end
	else if(L^.viaje.id > v.id) then
	begin
		nuevo^.sig := L;
		L := nuevo;
	end
	else
	begin
		inserto := false;
		aux := L;
		while((aux^.sig <> nil) AND (NOT(inserto))) do
		begin
			if(aux^.sig^.viaje.id > v.id) then
			begin
				inserto := true;
				nuevo^.sig := aux^.sig;
				aux^.sig := nuevo;
			end;
			aux := aux^.sig;
		end;
		if(NOT(inserto)) then
		begin
			aux^.sig := nuevo;
			nuevo^.sig := nil;
		end;
	end;
end;

procedure leerViaje(var v : t_viaje);
begin
	write('ID: '); readln(v.id);
	write('Auto: '); readln(v.auto);
	write('Origen: '); readln(v.origen);
	write('Destino: '); readln(v.destino);
	write('KM: '); readln(v.km);
	writeln;
end;

procedure imprimirViaje(v : t_viaje);
begin
	write(v.id, ' ');
	write(v.auto, ' ');
	writeln(v.km);
end;

procedure agregarAtras(v : t_viaje; var L, ult : lista);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.viaje := v;
	nuevo^.sig := nil;
	if(L = nil) then
		L := nuevo
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure cargarLista(var L : lista);
var
	entrada : t_viaje;
	ultimo : lista;
begin
	leerViaje(entrada);
	while(entrada.id <> 0) do
	begin
		agregarAtras(entrada, L, ultimo);
		leerViaje(entrada);
	end;
end;

procedure imprimirLista(L : lista);
begin
	while(L <> nil) do
	begin
		imprimirViaje(L^.viaje);
		L := L^.sig;
	end;
end;

var
	L : lista;
	max1, max2 : real;
	maxCod1, maxCod2 : integer;
	autoActual : t_viaje;
	puntoB : lista;
begin
	max1 := -1;
	max2 := -1;
	autoActual.km := -999;

	// Se dispone
	//cargarLista(L);

	//imprimirLista(L);

	while(L <> nil) do
	begin
		if(L^.viaje.auto = autoActual.auto) then
		begin
			autoActual.km := autoActual.km + L^.viaje.km;
		end
		else
		begin
			actualizarMax(autoActual, max1, max2, maxCod1, maxCod2);
			autoActual := L^.viaje;
		end;
		if(L^.viaje.km > 5) then
			insertarOrdenado(L^.viaje, puntoB);
		L := L^.sig;
	end;
	writeln('Autos con mas kms: ', maxCod1, ' ', maxCod2);
	//imprimirLista(puntoB);
end.
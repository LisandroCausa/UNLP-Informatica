program doce;
type
	t_dispositivo = record
		version : string;
		pantalla : real;
		ram : real;
	end;

	lista = ^nodo;
	nodo = record
		dispositivo : t_dispositivo;
		sig : lista;
	end;

	v_lista = ^v_nodo;
	v_nodo = record
		version : string;
		cant : integer;
		sig : v_lista;
	end;

procedure procesarVersiones(L : lista; var nueva : v_lista);
var
	aux : v_lista;
begin
	if(L <> nil) then
	begin
		new(nueva);
		aux := nueva;
		aux^.cant := 1;
		aux^.version := L^.dispositivo.version;
		aux := aux^.sig;
		while(aux <> nil) do
		begin
			if(L^.dispositivo.version = aux^.version) then
			begin
				aux^.cant := aux^.cant + 1;
			end
			else
			begin
				new(aux^.sig);
				aux := aux^.sig;
				aux^.cant := 1;
				aux^.version := L^.dispositivo.version;
			end;
			aux := aux^.sig;
		end;
	end;
end;

// A)
procedure informarCantPorVersion(L : lista);
var
	versiones : v_lista;
begin
	procesarVersiones(L, versiones);
	while(versiones <> nil) do
	begin
		writeln('Version ', versiones^.version, ': ', versiones^.cant);
		versiones := versiones^.sig;
	end;
end;

var
	L : lista;
	cantPuntoB : integer;
	sumaPantallas : real;
	cantDispositivos : integer;
	promedioPantallas : real;
begin
	// se disponen datos
	informarCantPorVersion(L);
	cantPuntoB := 0;
	sumaPantallas := 0;
	cantDispositivos := 0;
	while(L <> nil) do
	begin
		if((L^.dispositivo.ram > 3) AND (L^.dispositivo.pantalla <= 5)) then
			cantPuntoB := cantPuntoB + 1;
		sumaPantallas := sumaPantallas + L^.dispositivo.pantalla;
		cantDispositivos := cantDispositivos + 1;
		L := L^.sig;
	end;
	writeln('Cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas: ', cantPuntoB);
	if(cantDispositivos > 0) then
		promedioPantallas := sumaPantallas / cantDispositivos
	else
		promedioPantallas := -1;
	writeln('Tamaño promedio de pantalla: ', promedioPantallas:2:1);
end.
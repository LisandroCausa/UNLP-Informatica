program seis;
type
	str24 = string[24];
	t_rango_electromag = 1..7;
	t_sonda = record
		nombre : str24;
		meses : integer;
		costoConstruccion : real;
		costoMantenimiento : real;
		rangoElectromag : t_rango_electromag;
	end;
	lista = ^nodo;
	nodo = record
		datos : t_sonda;
		sig : lista;
	end;
	t_arr_rangosMag = array[t_rango_electromag] of integer;


procedure leerSonda(var sonda : t_sonda);
begin
	write('Nombre: ');
	readln(sonda.nombre);
	
	write('Meses de duracion: ');
	readln(sonda.meses);

	write('Costo de construccion: $');
	readln(sonda.costoConstruccion);

	write('Costo de mantenimiento mensual: $');
	readln(sonda.costoMantenimiento);

	write('Rango del espectro electromagnetico (1-7): ');
	readln(sonda.rangoElectromag);
	writeln;
end;

procedure cargarLista(var L:lista);
var
	sonda : t_sonda;
	aux : lista;
begin
	leerSonda(sonda);
	new(L);
	L^.datos := sonda;
	L^.sig := nil;
	aux := L;
	if(sonda.nombre <> 'GAIA') then
	begin
		repeat
			leerSonda(sonda);
			new(aux^.sig);
			aux := aux^.sig;
			aux^.datos := sonda;
			aux^.sig := nil;
		until(sonda.nombre = 'GAIA');
	end;
end;

procedure incrementar(var v : integer);
begin
	v := v + 1;
end;


var
	L : lista;
	aux : lista;
	i : integer;

	maxCosto : t_sonda;
	cantSondasCadaRango : t_arr_rangosMag;

	cantSondas : integer;
	sumaDuraciones : integer;
	duracionPromedio: real;
	cantSondasArribaPromedioC : integer;

	sumaCostosConstruccion : real;
	costoConstruccionPromedio : real;
begin
	cargarLista(L);
	writeln;
	aux := L;
	maxCosto := L^.datos;
	for i:=1 to 7 do
		cantSondasCadaRango[i] := 0;
	cantSondas := 0;
	sumaDuraciones := 0;
	sumaCostosConstruccion := 0;
	while(aux <> nil) do
	begin
		if((aux^.datos.costoConstruccion + aux^.datos.costoMantenimiento) 
		 > (maxCosto.costoConstruccion + maxCosto.costoMantenimiento)) then
			maxCosto := aux^.datos;
		incrementar(cantSondasCadaRango[aux^.datos.rangoElectromag]);
		incrementar(cantSondas);
		sumaDuraciones := sumaDuraciones + aux^.datos.meses;
		sumaCostosConstruccion := sumaCostosConstruccion + aux^.datos.costoConstruccion;
		aux := aux^.sig;
	end;
	duracionPromedio := sumaDuraciones / cantSondas;
	costoConstruccionPromedio := sumaCostosConstruccion / cantSondas;

	writeln('Nombre de la sonda mas costosa: ', maxCosto.nombre);
	writeln;
	writeln('La cantidad de sondas que realizaran estudios por cada rango del espectro electromagnetico:');
	for i:=1 to 7 do
		writeln(i, ' - ', cantSondasCadaRango[i]);

	cantSondasArribaPromedioC := 0;
	aux := L;
	writeln;
	writeln('Nombre de las sondas cuyo costo de construccion supera el costo promedio:');
	while(aux <> nil) do
	begin
		if(aux^.datos.meses > duracionPromedio) then
			incrementar(cantSondasArribaPromedioC);
		
		if(aux^.datos.costoConstruccion > costoConstruccionPromedio) then
			writeln(aux^.datos.nombre);
		aux := aux^.sig;
	end;
	writeln;
	writeln;
	writeln('Cantidad de sondas cuya duracion supera la duracion promedio: ', cantSondasArribaPromedioC);
end.
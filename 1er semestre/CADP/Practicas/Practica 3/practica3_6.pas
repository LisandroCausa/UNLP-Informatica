program seis;
type
    t_procesador = record
        marca : string;
        linea : string;
        cores : integer;
        velocidadReloj : real;
        nmTransistores : integer;
    end;

procedure leerProcesador(var procesador : t_procesador);
begin
    write('Marca: ');
    readln(procesador.marca);
    
    write('Linea: ');
    readln(procesador.linea);
    
    write('Cores: ');
    readln(procesador.cores);

    write('Velocidad del reloj (Ghz): ');
    readln(procesador.velocidadReloj);

    write('Tamaño de los transistores (nm): ');
    readln(procesador.nmTransistores);
end;

var
	procesador : t_procesador;
	marcaActual : string;

    cantTransistores14 : integer;
    maxTransistores14_1 : integer;
    marcaMaxTransistores14_1 : string;
	maxTransistores14_2 : integer;
	marcaMaxTransistores14_2 : string;

	cantMulticore : integer;
	cantMulticoreINTEL : integer;
	cantMulticoreAMD : integer;
begin
    maxTransistores14_1 := -1;
	maxTransistores14_2 := -1;
	cantTransistores14 := 0;
	cantMulticore := 0;
	cantMulticoreINTEL := 0;
	cantMulticoreAMD := 0;
	leerProcesador(procesador);
	marcaActual := procesador.marca;
	while(procesador.cores > 0) do
	begin
		if(procesador.marca <> marcaActual) then
		begin
			if(cantTransistores14 >= maxTransistores14_1) then
			begin
				maxTransistores14_2 := maxTransistores14_1;
				maxTransistores14_1 := cantTransistores14;
				marcaMaxTransistores14_2 := marcaMaxTransistores14_1;
				marcaMaxTransistores14_1 := marcaActual;
			end
			else if(cantTransistores14 >= maxTransistores14_2) then
			begin
				maxTransistores14_2 := cantTransistores14;
				marcaMaxTransistores14_2 := marcaActual;
			end;

			if(marcaActual = 'intel') then
			begin
				cantMulticoreINTEL := cantMulticore;
			end
			else if(marcaActual = 'amd') then
			begin
				cantMulticoreAMD := cantMulticore;
			end;
            cantTransistores14 := 0;
			cantMulticore := 0;
			marcaActual := procesador.marca;
		end;

        if(procesador.nmTransistores = 14) then
		    cantTransistores14 := cantTransistores14 + 1;

		if((procesador.cores > 2) AND (procesador.nmTransistores <= 22)) then
			writeln('El procesador ', procesador.marca, ' ', procesador.linea, ' tiene mas de 2 cores y transistores de no mas de 22 nm');

		if((procesador.cores > 1) AND (procesador.velocidadReloj >= 2)) then
			cantMulticore := cantMulticore + 1;

		writeln;
		leerProcesador(procesador);
	end;
	if(cantTransistores14 >= maxTransistores14_1) then
	begin
		maxTransistores14_2 := maxTransistores14_1;
		maxTransistores14_1 := cantTransistores14;
		marcaMaxTransistores14_2 := marcaMaxTransistores14_1;
		marcaMaxTransistores14_1 := marcaActual;
	end
	else if(cantTransistores14 >= maxTransistores14_2) then
	begin
		maxTransistores14_2 := cantTransistores14;
		marcaMaxTransistores14_2 := marcaActual;
	end;

	writeln;
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: ', marcaMaxTransistores14_1, ' y ', marcaMaxTransistores14_2);
	writeln;
	writeln('Cantidad de procesadores multicore cuyos relojes alcancen mas 2 Ghz');
	writeln('Intel: ', cantMulticoreINTEL);
	writeln('AMD: ', cantMulticoreAMD);
end.
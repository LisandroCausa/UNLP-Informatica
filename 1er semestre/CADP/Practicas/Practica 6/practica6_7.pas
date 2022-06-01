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

// A)
function cumpleH2020(sonda : t_sonda) : boolean;
begin
	cumpleH2020 := ((sonda.costoMantenimiento < sonda.costoConstruccion) AND (sonda.rangoElectromag > 1));
end;

// B)
procedure clasificarPorH2020(L : lista; var cumplen : lista; var no_cumplen : lista);
var
	ultimo_cumplen : lista;
	ultimo_no_cumplen : lista;
begin
	cumplen := nil;
	no_cumplen := nil;
	ultimo_cumplen := nil;
	ultimo_no_cumplen := nil;
	while(L <> nil) do
	begin
		if(cumpleH2020(L^.datos)) then
		begin
			if(ultimo_cumplen = nil) then
			begin
				new(ultimo_cumplen);
				cumplen := ultimo_cumplen;
			end
			else
			begin
				new(ultimo_cumplen^.sig);
				ultimo_cumplen := ultimo_cumplen^.sig;
			end;
			ultimo_cumplen^.datos := L^.datos;
			ultimo_cumplen^.sig := nil;
		end
		else
		begin
			if(ultimo_no_cumplen = nil) then
			begin
				new(ultimo_no_cumplen);
				no_cumplen := ultimo_no_cumplen;
			end
			else
			begin
				new(ultimo_no_cumplen^.sig);
				ultimo_no_cumplen := ultimo_no_cumplen^.sig;
			end;
			ultimo_no_cumplen^.datos := L^.datos;
			ultimo_no_cumplen^.sig := nil;
		end;
		L := L^.sig;
	end;
end;

procedure imprimirInfoNoCumplenH2020(L : lista);
var
	cumplen : lista;
	no_cumplen : lista;
	cant : integer;
	costoTotal : real;
begin
	cant := 0;
	costoTotal := 0;
	clasificarPorH2020(L, cumplen, no_cumplen);
	while(no_cumplen <> nil) do
	begin
		cant := cant + 1;
		costoTotal := costoTotal + no_cumplen^.datos.costoConstruccion + no_cumplen^.datos.costoMantenimiento;
		no_cumplen := no_cumplen^.sig;
	end;
	writeln('Cantidad: ', cant);
	writeln('Costo total: $', costoTotal:6:2);
end;

begin
end.
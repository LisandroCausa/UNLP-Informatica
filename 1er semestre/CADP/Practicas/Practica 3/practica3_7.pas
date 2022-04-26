program siete;
type
	centroInvestigacion = record
		nombre			: string;
		universidad		: string;
		investigadores	: integer;
		becarios		: integer;
	end;

procedure leerCentro(var centro : centroInvestigacion);
begin
	write('Nombre: ');
	readln(centro.nombre);
	
	write('Universidad: ');
	readln(centro.universidad);

	write('Cantidad de investigadores: ');
	readln(centro.investigadores);

	write('Cantidad de becarios: ');
	readln(centro.becarios);
	writeln;
end;

var
	centro : centroInvestigacion;
	uniActual : string;
	cantCentrosUni : integer;

	sumaInvestigadores : integer;
	maxInvestigadores : integer;
	universidadMasInvestigadores : string;

	centroMinBecarios1 : centroInvestigacion;
	centroMinBecarios2 : centroInvestigacion;
begin
	maxInvestigadores := -1;
	centroMinBecarios1.becarios := 9999;
	centroMinBecarios2.becarios := 9999;
	leerCentro(centro);
	while(centro.investigadores <> 0) do  // CORTE DE CONTROL
	begin
		cantCentrosUni := 0;
		sumaInvestigadores := 0;
		uniActual := centro.universidad;
		while((uniActual = centro.universidad) AND (centro.investigadores <> 0)) do
		begin
			cantCentrosUni := cantCentrosUni + 1;
			sumaInvestigadores := sumaInvestigadores + centro.investigadores;
			if(centro.becarios <= centroMinBecarios1.becarios) then
			begin
				centroMinBecarios2 := centroMinBecarios1;
				centroMinBecarios1 := centro;
			end
			else if(centro.becarios <= centroMinBecarios2.becarios) then
			begin
				centroMinBecarios2 := centro;
			end;
			leerCentro(centro);
		end;
		writeln('Cantidad de centros de investigacion en ', uniActual, ': ', cantCentrosUni);
		
		if(sumaInvestigadores >= maxInvestigadores) then
		begin
			maxInvestigadores := sumaInvestigadores;
			universidadMasInvestigadores := uniActual;
		end;
	end;
	writeln('La universidad con mayor cantidad de investigadores en sus centros: ', universidadMasInvestigadores);
	writeln('Los dos centros con menor cantidad de becarios: ', centroMinBecarios1.nombre, ' y ', centroMinBecarios2.nombre);
end.
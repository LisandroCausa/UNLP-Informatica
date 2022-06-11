program cuatro;
const
	SEMANAS = 42;
type
	t_pesos = array[1..SEMANAS] of real;
	t_paciente = record
		nombre : string;
		apellido : string;
		pesos : t_pesos;
		dimL : integer;
	end;
	lista = ^nodo;
	nodo = record
		paciente : t_paciente;
		sig : lista;
	end;

function semanaMayorAumento(p : t_paciente) : integer;
var
	maxDif : real;
	maxSem : integer;
	dif : real;
	i : integer;
begin
	maxDif := -1;
	maxSem := -1;
	for i:=2 to p.dimL do
	begin
		dif := p.pesos[i] - p.pesos[i - 1];
		if(dif > maxDif) then
		begin
			maxDif := dif;
			maxSem := i;
		end;
	end;
	semanaMayorAumento := maxSem;
end;

function aumentoPesoTotal(p : t_paciente) : real;
begin
	aumentoPesoTotal := p.pesos[p.dimL] - p.pesos[1];
end;


var
	L : lista;
begin
    // Dispone datos
	while(L <> nil) do
	begin
		writeln('La semana con mayor aumento fue la: ', semanaMayorAumento(L^.paciente));
		writeln('Aumento de peso total: ', aumentoPesoTotal(L^.paciente):2:2);
		L := L^.sig;
	end;
end.
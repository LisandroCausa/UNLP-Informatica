program uno;
const
	N = 500;
type
	vector = array[1..N] of integer;

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

function existeValorB(v : vector; num : integer) : boolean;
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
	existeValorB := existe;
end;

begin
end.
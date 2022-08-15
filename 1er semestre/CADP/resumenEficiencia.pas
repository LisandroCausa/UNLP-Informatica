program resumenEficiencia;
type
	t_ptr = ^integer;
var
	i, aux : integer;
	pepe : real;
	puntero : t_ptr;
begin
	aux := 1;        // asignacion = 1UT
	aux := aux + 3;  // suma + asignacion = 2UT
	aux := aux - 2; // resta + asignacion = 2UT
	aux := aux * 2; // multi + asignacion = 2UT
	pepe := aux / 2; // divi + asignacion = 2UT
	
	readln(i); // Lectura = 0 UT
	writeln(i);// Escritura = 0 UT

	new(puntero);    // 0 UT
	dispose(puntero);// 0 UT

	// Eficiencia IF
	// evaluar condicion/es + cuerpo
	// evaluar condicion/es = 1UT por cada operador logico (AND, OR, NOT, =, <, >, <>, >=, <=)
	// PD: se suma el cuerpo en caso de que se cumpla la condicion del if
	// en caso de no saber se toma el peor caso, es decir que si se ejecuta
	if(aux < 100) then // condicion = 1 UT
	begin                    // se cumple aux < 100? si
		aux := aux + 1;      // 2UT
		i := i + 4 + aux * 5;// 4UT
	end; // cuerpo = 2UT + 4UT = 6UT
	// eficiencia if = 1UT + 6UT = 7UT


	// Eficiencia IF-ELSE
	// evaluar condicion/es + MAX(cuerpo1, cuerpo2)
	// siendo MAX() una funcion que nos devuelve el maximo entre 2 elementos
	// siendo cuerpo1 el cuerpo del if en UTs
	// siendo cuerpo2 el cuerpo del else en UTs
	if((aux < 100) and (i = 2)) then // condiciones = 3UT
	begin
		aux := 77;             // 1UT
		write('----');         // 0UT
		i := aux * 3 - 19;     // 3UT
		aux := aux - (i MOD 5);// 3UT
	end // cuerpo1 = 1UT + 0UT + 3UT + 3UT = 7UT
	else
	begin
		readln(i);   // 0UT
		i := i DIV 2;// 2UT
	end; // cuerpo2 = 0UT + 2UT = 2UT
	// eficiencia if-else = 3UT + MAX(7, 2) = 10UT


	// Eficiencia FOR
	// 3N + 2 + N(cuerpo)
	for i:=1 to 10 do // N = 10
	begin
		aux := aux - 12; // resta + asignacion = 2UT
		aux := aux * 2;  // multi + asignacion = 2UT
	end;                 // cuerpo = 4UT
	// eficiencia for = 3x10 + 2 + 10x4 = 72UT

	// ejemplo
	readln(aux);
	for i:=1 to aux do // cuantas veces se ejecuta?
	begin
		pepe := i * 3; // 2UT
	end;
	// eficiencia = 3N + 2 + 2N
	// eficiencia = 5N + 2  se deja asi con incognita


	// Eficiencia WHILE
	// CxN + C + N(Cuerpo) = C(N + 1) + N(Cuerpo)
	// siendo C las UTs de evaluar condicion/es
	i := 8; // podemos analizar que el bucle se va a
	        // ejecutar 8 veces. N = 8
	while(i > 0) do // C = 1UT
	begin
		aux := aux + i * 2;// 3UT
		pepe := pepe / 2;  // 2UT
		i := i - 1;        // 2UT
	end; // Cuerpo = 3UT + 2UT + 2UT = 7UT
	// eficiencia = 1(8 + 1) + 8(7UT)
	// eficiencia = 9UT + 56UT
	// eficiencia = 65UT


	// -RESUMEN DE FORMULAS-
	// C = evaluar condicion/es en UTs
	// N = veces que se ejecuta
	// Cuerpo = ejecutar cuerpo en UTs
	//
	// IF = C + Cuerpo
	// IF-ELSE = C + MAX(Cuerpo1, Cuerpo2)
	// FOR = 3N + 2 + N(Cuerpo)
	// WHILE = C(N + 1) + N(Cuerpo)
end.
program practica1_6;
var
    legajo      : integer;
    promedio    : real;
    alumnos     : integer;
    alumnosAprobados : integer;
    alumnosDestacados : integer;
    porcentajeAlumnosDestacados : real;
begin
    alumnos := 0;
    alumnosAprobados := 0;
    alumnosDestacados := 0;
    write('Legajo: ');
    readln(legajo);
    while(legajo <> -1) do
    begin
        alumnos := alumnos + 1;
        write('Promedio: ');
        readln(promedio);
        if(promedio > 6.5) then
            alumnosAprobados := alumnosAprobados + 1;
        if((promedio > 8.5) and (legajo < 2500)) then
            alumnosDestacados := alumnosDestacados + 1;
        writeln('------------------------');
        write('Legajo: ');
        readln(legajo);
    end;
    writeln;
    writeln;
    writeln('Alumnos: ', alumnos);
    writeln('Alumnos aprobados (promedio mayor a 6.5): ', alumnosAprobados);

    // Evitar que se divida por 0
    if(alumnos > 0) then
        porcentajeAlumnosDestacados := (alumnosDestacados * 100) / alumnos
    else
        porcentajeAlumnosDestacados := 0;
    writeln('Porcentaje de alumnos destacados: ', porcentajeAlumnosDestacados:3:0, '%');
end.
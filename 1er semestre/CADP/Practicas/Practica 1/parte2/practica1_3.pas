program tres;
type
    nota = 1..10;
var
    nombre          : string;
    notaExamen      : nota;
    alumnosAprobados: integer;
    alumnosRegulares: integer;
begin
    alumnosAprobados := 0;
    alumnosRegulares := 0;
    repeat
    begin
        write('nombre: ');
        readln(nombre);
        write('nota examen: ');
        readln(notaExamen);
        writeln('-------------------');
        if(notaExamen >= 8) then
            alumnosAprobados := alumnosAprobados + 1;
        if(notaExamen = 7) then
            alumnosRegulares := alumnosRegulares + 1;
    end
    until(nombre = 'Zidane Zinedine');
    writeln('alumnos aprobados: ', alumnosAprobados);
    writeln('alumnos con 7: ', alumnosRegulares);
end.
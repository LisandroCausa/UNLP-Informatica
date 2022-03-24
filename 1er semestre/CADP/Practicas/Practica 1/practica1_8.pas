program practica1_8;
var
    letra1 : char;
    letra2 : char;
    letra3 : char;
    numeroDeVocales : integer;
begin
    numeroDeVocales := 0;
    read(letra1);
    read(letra2);
    read(letra3);
    if((letra1 = 'a') or (letra1 = 'e') or (letra1 = 'i') or (letra1 = 'o') or (letra1 = 'u')) then
        numeroDeVocales := numeroDeVocales + 1;
    if((letra2 = 'a') or (letra2 = 'e') or (letra2 = 'i') or (letra2 = 'o') or (letra2 = 'u')) then
        numeroDeVocales := numeroDeVocales + 1;
    if((letra3 = 'a') or (letra3 = 'e') or (letra3 = 'i') or (letra3 = 'o') or (letra3 = 'u')) then
        numeroDeVocales := numeroDeVocales + 1;
    
    if(numeroDeVocales = 3) then
        writeln('Los tres son vocales.')
    else
        writeln('al menos un caracter no era vocal.');
end.
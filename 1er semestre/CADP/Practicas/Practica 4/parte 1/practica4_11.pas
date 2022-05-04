program once;
const
	PUBLICACIONES = 200;
type
	t_foto = record
		titulo : string;
		autor : string;
		likes : integer;
		clics : integer;
		comentarios : integer;
	end;
	t_fotos = array[1..PUBLICACIONES] of t_foto;

procedure leerFoto(var f:t_foto);
begin
	write('Titulo: ');
	readln(f.titulo);
	
	write('Autor: ');
	readln(f.autor);
	
	write('Likes: ');
	readln(f.likes);

	write('Clics: ');
	readln(f.clics);

	write('Comentarios: ');
	readln(f.comentarios);
	writeln;
end;

procedure cargarFotos(var fotos:t_fotos);
var
	i : integer;
begin
	for i:=1 to PUBLICACIONES do
		leerFoto(fotos[i]);
end;

var
	fotos : t_fotos;
	i : integer;
	masVista : t_foto;
	likesVandelay : integer;
begin
	masVista.clics := -1;
	likesVandelay := 0;
	cargarFotos(fotos);
	for i:=1 to PUBLICACIONES do
	begin
		if(fotos[i].clics > masVista.clics) then
			masVista := fotos[i];
		if(fotos[i].autor = 'art vandelay') then
			likesVandelay := likesVandelay + fotos[i].likes;
	end;
	writeln;
	writeln('Foto mas vista: ', masVista.titulo);
	writeln('Cantidad de Likes de Art Vandelay: ', likesVandelay);
	writeln('Cantidad de Comentarios por publicacion:');
	for i:=1 to PUBLICACIONES do
		writeln(fotos[i].comentarios);
end.
program tema1Reducido_parcial;
type
	t_categorias = 1..26;
	t_producto = record
		nombre : string;
		precio : real;
	end;
	arr_categorias = array[t_categorias] of t_producto;
	t_compra = record
		dni : string;
		categoria : t_categorias;
		kilosComprados : real;
	end;
	lista = ^nodo;
	nodo = record
		compra : t_compra;
		sig : lista;
	end;
	arr_montoCat = array[t_categorias] of real;

procedure leerCategoria(var producto : t_producto; var codigo : t_categorias);
begin
	write('Nombre: ');
	readln(producto.nombre);

	write('Codigo: ');
	readln(codigo);

	write('Precio: $');
	readln(producto.precio);
end;

procedure cargarCategorias(var cat : arr_categorias);
var
	j : integer;
	entrada : t_producto;
	indice : t_categorias;
begin
	for j:=1 to 26 do
	begin
		leerCategoria(entrada, indice);
		cat[indice] := entrada;
	end;
end;

procedure puntoB(L:lista; categorias:arr_categorias; var dni_maxCompras:string; var montosTotales:arr_montoCat);
var
	max : integer;
	i : integer;
	dniActual : string;
	cantActual : integer;
	monto : real;
begin
	max := -1;
	for i:=1 to 26 do
		montosTotales[i] := 0;
	dniActual := '';
	cantActual := 0;
	while(L <> nil) do
	begin
		monto := L^.compra.kilosComprados * categorias[L^.compra.categoria].precio;
		montosTotales[L^.compra.categoria] := montosTotales[L^.compra.categoria] + monto;

		if(L^.compra.dni = dniActual) then
		begin
			cantActual := cantActual + 1;
		end
		else // si son distintos, actualizar
		begin
			if(cantActual >= max) then
			begin
				max := cantActual;
				dni_maxCompras := dniActual;
			end;
			cantActual := 1;
			dniActual := L^.compra.dni;
		end;
		L := L^.sig;
	end;
end;

// Programa Principal
var
	compras : lista; // se dispone
	categorias : arr_categorias;
	dniMasCompras : string;
	montosTotales : arr_montoCat;
	i : integer;
begin
	//cargarCompras(compras);  // se dispone
	cargarCategorias(categorias);
	puntoB(compras, categorias, dniMasCompras, montosTotales);
	writeln('El DNI del cliente que mas compras ha realizado es ', dniMasCompras);
	writeln('Monto total recaudado por cada categoria:');
	for i:=1 to 26 do
	begin
		write(i, ' - $');
		writeln(montosTotales[i]:6:2);
	end;
end.
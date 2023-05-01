package tp04.ejercicio1;

public class TestArbolGeneral {

	public static void main(String[] args) {
		ArbolGeneral<Integer> arbol = new ArbolGeneral<Integer>(53);
		ArbolGeneral<Integer> aux;
		
		aux = new ArbolGeneral<Integer>(4);
		aux.agregarHijo(new ArbolGeneral<Integer>(19));
		aux.agregarHijo(new ArbolGeneral<Integer>(6));
		aux.agregarHijo(new ArbolGeneral<Integer>(33));
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<Integer>(77);
		aux.agregarHijo(new ArbolGeneral<Integer>(80));
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<Integer>(61);
		aux.agregarHijo(new ArbolGeneral<Integer>(15));
		aux.agregarHijo(new ArbolGeneral<Integer>(1));
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<Integer>(43);
		ArbolGeneral<Integer> aux2 = new ArbolGeneral<Integer>(68);
		aux2.agregarHijo(new ArbolGeneral<Integer>(78));
		aux.agregarHijo(aux2);
		aux.agregarHijo(new ArbolGeneral<Integer>(11));
		aux.agregarHijo(new ArbolGeneral<Integer>(51));
		arbol.agregarHijo(aux);
		
		System.out.println(arbol.altura());
		System.out.println(arbol.nivel(78));
		System.out.println(arbol.ancho());
		System.out.println(arbol.esAncestro(4, 33));

	}

}

package ejercicio7;

import tp04.ejercicio1.*;

public class TestRedAgua {

	public static void main(String[] args) {
		ArbolGeneral<String> arbol = new ArbolGeneral<String>("A");
		ArbolGeneral<String> aux;
		ArbolGeneral<String> aux2;
		
		aux = new ArbolGeneral<String>("B");
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<String>("C");
		aux.agregarHijo(new ArbolGeneral<String>("F"));
		aux2 = new ArbolGeneral<String>("G");
		aux2.agregarHijo(new ArbolGeneral<String>("L"));
		aux.agregarHijo(aux2);
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<String>("D");
		aux.agregarHijo(new ArbolGeneral<String>("H"));
		aux.agregarHijo(new ArbolGeneral<String>("I"));
		aux2 = new ArbolGeneral<String>("J");
		aux2.agregarHijo(new ArbolGeneral<String>("M"));
		aux2.agregarHijo(new ArbolGeneral<String>("N"));
		aux.agregarHijo(aux2);
		aux.agregarHijo(new ArbolGeneral<String>("K"));
		arbol.agregarHijo(aux);
		
		arbol.agregarHijo(new ArbolGeneral<String>("E"));
		
		
		
		RedDeAguaPotable red = new RedDeAguaPotable(arbol);
		
		System.out.println(red.minimoCaudal(1000)); // debe retornar 31.25, no 25
	}

}

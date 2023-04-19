package ejercicio5;

import tp04.ejercicio1.*;

public class TestEjercicio5 {

	public static void main(String[] args) {
		ArbolGeneral<AreaEmpresa> arbol = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("M", 14));
		ArbolGeneral<AreaEmpresa> aux;
		
		aux = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("J", 13));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("A", 4)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("B", 7)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("C", 5)));
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("K", 25));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("D", 6)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("E", 10)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("F", 18)));
		arbol.agregarHijo(aux);
		
		aux = new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("L", 10));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("G", 9)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("H", 12)));
		aux.agregarHijo(new ArbolGeneral<AreaEmpresa>(new AreaEmpresa("I", 19)));
		arbol.agregarHijo(aux);
		
		AnalizadorArbol analizadorArbol = new AnalizadorArbol();
		System.out.println(analizadorArbol.devolverMaximoPromedio(arbol));
	}

}

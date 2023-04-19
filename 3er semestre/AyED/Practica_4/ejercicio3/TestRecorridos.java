package ejercicio3;

import tp02.ejercicio2.*;
import tp04.ejercicio1.ArbolGeneral;

public class TestRecorridos {

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
		aux.agregarHijo(new ArbolGeneral<Integer>(68));
		aux.agregarHijo(new ArbolGeneral<Integer>(11));
		aux.agregarHijo(new ArbolGeneral<Integer>(51));
		arbol.agregarHijo(aux);
		
		RecorridosAG recorridos = new RecorridosAG();
		int n = 9;
		
		System.out.println("PreOrden: ");
		imprimirLista(recorridos.numerosImparesMayoresQuePreOrden(arbol, n));
		
		System.out.println("\nInOrden: ");
		imprimirLista(recorridos.numerosImparesMayoresQueInOrden(arbol, n));
		
		System.out.println("\nPostOrden: ");
		imprimirLista(recorridos.numerosImparesMayoresQuePostOrden(arbol, n));
		
		System.out.println("\nPor niveles: ");
		imprimirLista(recorridos.numerosImparesMayoresQuePorNiveles(arbol, n));
	}
	
	public static void imprimirLista(ListaGenerica<Integer> lista) {
		lista.comenzar();
		while(!lista.fin())
		{
			System.out.print(lista.proximo() + ", ");
		}
		System.out.println();
	}
}

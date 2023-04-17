package ejercicio5;

import tp03.ejercicio1.ArbolBinario;

public class TestProfundidad {

	public static void main(String[] args) {
		/*
		 *   Arbol Binario de Ejemplo:
		 * 
		 *            41
		 *    20              11
		 * 65    99       91       50
		 *          32           72   29
		 */
		ArbolBinario<Integer> arbol = new ArbolBinario<Integer>(41);
		arbol.agregarHijoIzquierdo(new ArbolBinario<Integer>(20));
		arbol.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(65));
		arbol.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(99));
		arbol.getHijoIzquierdo().getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(32));
		arbol.agregarHijoDerecho(new ArbolBinario<Integer>(11));
		arbol.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(91));
		arbol.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(50));
		arbol.getHijoDerecho().getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(72));
		arbol.getHijoDerecho().getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(29));
		
		ProfundidadDeArbolBinario profundidadArbol = new ProfundidadDeArbolBinario(arbol);
		System.out.println(profundidadArbol.sumaElementosProfundidad(2));
	}

}

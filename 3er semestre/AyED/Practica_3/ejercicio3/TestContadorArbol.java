package ejercicio3;

import tp03.ejercicio1.ArbolBinario;
import tp02.ejercicio2.*;

public class TestContadorArbol {

	public static void main(String[] args) {
		/*
		 *   Arbol Binario de Ejemplo:
		 * 
		 *            41
		 *    20              11
		 * 65    99       91       50
		 *          32           72   28
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
		arbol.getHijoDerecho().getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(28));
		
		ContadorArbol contadorArbol = new ContadorArbol(arbol);
		System.out.println("Numeros pares");
		
		System.out.print("Recorrido InOrden: ");
		ListaGenerica<Integer> pares = contadorArbol.numerosParesInorden();
		pares.comenzar();
		while(!pares.fin())
		{
			System.out.print(pares.proximo() + ", ");
		}
		System.out.println();
	
		System.out.print("Recorrido PostOrden: ");
		pares = contadorArbol.numerosParesPostorden();
		pares.comenzar();
		while(!pares.fin())
		{
			System.out.print(pares.proximo() + ", ");
		}
		System.out.println();
	}

}

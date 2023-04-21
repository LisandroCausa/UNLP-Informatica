package ejercicio5;

import tp03.ejercicio1.*;
import tp02.ejercicio3.ColaGenerica;

public class ProfundidadDeArbolBinario {
	private ArbolBinario<Integer> arbol;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int p) {
 		int suma = 0;
		int altura = 0;
		ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
		cola.encolar(this.arbol);
		cola.encolar(null);
		while(!cola.esVacia())
		{
			ArbolBinario<Integer> proximo = cola.desencolar();
			if(proximo != null)
			{
				if(altura == p)
				{
					suma += proximo.getDato();
				}
				else if(altura < p)
				{
					if(proximo.tieneHijoIzquierdo())
						cola.encolar(proximo.getHijoIzquierdo());
					
					if(proximo.tieneHijoDerecho())
						cola.encolar(proximo.getHijoDerecho());
				}
			}
			else if(!cola.esVacia())
			{
				altura++;
				cola.encolar(null);
			}
		}
		return suma;
	}
}

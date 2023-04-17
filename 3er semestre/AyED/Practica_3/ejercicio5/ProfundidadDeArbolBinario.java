package ejercicio5;

import tp03.ejercicio1.*;

public class ProfundidadDeArbolBinario {
	private ArbolBinario<Integer> arbol;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int p) {
		if(p == 0)
			return this.arbol.getDato();
		
		if(p < 0)
			return 0;
		
		int izquierdo = 0;
		if(this.arbol.tieneHijoIzquierdo())
		{
			ArbolBinario<Integer> hijoIzquierdo = this.arbol.getHijoIzquierdo();
			izquierdo = (new ProfundidadDeArbolBinario(hijoIzquierdo)).sumaElementosProfundidad(p-1);
		}
		
		int derecho = 0;
		if(this.arbol.tieneHijoDerecho())
		{
			ArbolBinario<Integer> hijoDerecho = this.arbol.getHijoDerecho();
			derecho = (new ProfundidadDeArbolBinario(hijoDerecho)).sumaElementosProfundidad(p-1);
		}
		
		return izquierdo + derecho;
	}
}

package ejercicio4;

import tp03.ejercicio1.ArbolBinario;

public class RedBinariaLlena {
	private ArbolBinario<Integer> arbol;
	
	public RedBinariaLlena(ArbolBinario<Integer> dato) {
		this.arbol = dato;
	}
	
	public int retardoReenvio() {
		if(this.arbol.esHoja())
			return 0;
		
		Integer retardoHijoIzquierdo = 0;
		if(this.arbol.tieneHijoIzquierdo())
		{
			ArbolBinario<Integer> hijoIzquierdo = this.arbol.getHijoIzquierdo();
			retardoHijoIzquierdo = (new RedBinariaLlena(hijoIzquierdo)).retardoReenvio();
		}
		
		Integer retardoHijoDerecho = 0;
		if(this.arbol.tieneHijoDerecho())
		{
			ArbolBinario<Integer> hijoDerecho = this.arbol.getHijoDerecho();
			retardoHijoDerecho = (new RedBinariaLlena(hijoDerecho)).retardoReenvio();
		}
		
		return (this.arbol.getDato() + max(retardoHijoIzquierdo, retardoHijoDerecho));
	}
	
	private static Integer max(Integer a, Integer b) {
		return (a > b) ? a : b;
	}
}
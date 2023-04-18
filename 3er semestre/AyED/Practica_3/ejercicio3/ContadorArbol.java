package ejercicio3;

import tp03.ejercicio1.ArbolBinario;
import tp02.ejercicio2.*;

public class ContadorArbol {
	private ArbolBinario<Integer> arbol;
	
	
	public ContadorArbol(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public ArbolBinario<Integer> getArbol() {
		return this.arbol;
	}
	
	public ListaGenerica<Integer> numerosParesInorden() {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		if(this.getArbol().tieneHijoIzquierdo())
		{
			ArbolBinario<Integer> hijoIzquierdo = this.getArbol().getHijoIzquierdo();
			ListaGenerica<Integer> listaIzquierdo = (new ContadorArbol(hijoIzquierdo)).numerosParesInorden();
			listaIzquierdo.comenzar();
			while(!listaIzquierdo.fin())
			{
				lista.agregarFinal(listaIzquierdo.proximo());
			}
		}
		
		if(esPar(this.getArbol().getDato()))
			lista.agregarFinal(this.getArbol().getDato());
		
		if(this.getArbol().tieneHijoDerecho())
		{
			ArbolBinario<Integer> hijoDerecho = this.getArbol().getHijoDerecho();
			ListaGenerica<Integer> listaDerecho = (new ContadorArbol(hijoDerecho)).numerosParesInorden();
			listaDerecho.comenzar();
			while(!listaDerecho.fin())
			{
				lista.agregarFinal(listaDerecho.proximo());
			}
		}
		
		return lista;
	}
	
	public ListaGenerica<Integer> numerosParesPostorden() {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		if(this.getArbol().tieneHijoIzquierdo())
		{
			ArbolBinario<Integer> hijoIzquierdo = this.getArbol().getHijoIzquierdo();
			ListaGenerica<Integer> listaIzquierdo = (new ContadorArbol(hijoIzquierdo)).numerosParesPostorden();
			listaIzquierdo.comenzar();
			while(!listaIzquierdo.fin())
			{
				lista.agregarFinal(listaIzquierdo.proximo());
			}
		}
		
		if(this.getArbol().tieneHijoDerecho())
		{
			ArbolBinario<Integer> hijoDerecho = this.getArbol().getHijoDerecho();
			ListaGenerica<Integer> listaDerecho = (new ContadorArbol(hijoDerecho)).numerosParesPostorden();
			listaDerecho.comenzar();
			while(!listaDerecho.fin())
			{
				lista.agregarFinal(listaDerecho.proximo());
			}
		}
		
		if(esPar(this.getArbol().getDato()))
			lista.agregarFinal(this.getArbol().getDato());
		
		return lista;
	}
	
	private static boolean esPar(Integer numero) {
		return (numero % 2 == 0);
	}
	

}
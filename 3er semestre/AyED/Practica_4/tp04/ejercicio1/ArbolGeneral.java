package tp04.ejercicio1;

import tp02.ejercicio2.ListaEnlazadaGenerica;
import tp02.ejercicio2.ListaGenerica;
import tp02.ejercicio3.ColaGenerica;

public class ArbolGeneral<T> {

	private T dato;

	private ListaGenerica<ArbolGeneral<T>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();

	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public void setHijos(ListaGenerica<ArbolGeneral<T>> hijos) {
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ArbolGeneral(T dato) {
		this.dato = dato;
	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos) {
		this(dato);
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		return this.hijos;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		this.getHijos().agregarFinal(unHijo);
	}

	public boolean esHoja() {

		return !this.tieneHijos();
	}
	
	public boolean tieneHijos() {
		return !this.hijos.esVacia();
	}
	
	public boolean esVacio() {

		return this.dato == null && !this.tieneHijos();
	}

	

	public void eliminarHijo(ArbolGeneral<T> hijo) {
		if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			if (hijos.incluye(hijo)) 
				hijos.eliminar(hijo);
		}
	}
	
	public ListaEnlazadaGenerica<T> preOrden() {
		return null;
	}
	
	public Integer altura() {
		if(this.esHoja())
			return 0;
		int max = Integer.MIN_VALUE;
		ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
		hijos.comenzar();
		while(!hijos.fin())
		{
			int alturaProximo = hijos.proximo().altura();
			if(alturaProximo > max)
				max = alturaProximo;
		}
		return max + 1;
	}

	public Integer nivel(T dato) {
		if(this.getDato() == dato)
		{
			return 0;
		}

		int resultado = -1;
		boolean encontro = false;
		ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
		hijos.comenzar();
		while(!hijos.fin() && !encontro)
		{
			int proximoResultado = hijos.proximo().nivel(dato);
			if(proximoResultado != -1)
			{
				encontro = true;
				resultado = proximoResultado;
			}
		}
		if(encontro)
		{
			return resultado + 1;
		}
		return -1;
	}

	public Integer ancho() {
		int max = Integer.MIN_VALUE;
		int actual = 0;
		ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while(!cola.esVacia())
		{
			ArbolGeneral<T> proximo = cola.desencolar();
			if(proximo != null)
			{
				actual++;
				ListaGenerica<ArbolGeneral<T>> hijos = proximo.getHijos();
				hijos.comenzar();
				while(!hijos.fin())
				{
					cola.encolar(hijos.proximo());
				}
			}
			else if(!cola.esVacia())
			{
				if(actual > max)
				{
					max = actual;
				}
				actual = 0;
				cola.encolar(null);
			}
		}
		// procesar ultimo
		if(actual > max)
		{
			max = actual;
		}
		return max;
	}

	public Boolean esAncestro(T a, T b) {
		ArbolGeneral<T> nodoAncestro = this.buscar(a);
		return (nodoAncestro != null && nodoAncestro.buscar(b) != null);
	}
	
	private ArbolGeneral<T> buscar(T dato) {
		if(this.getDato().equals(dato))
			return this;
		
		ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
		hijos.comenzar();
		ArbolGeneral<T> resultado = null;
		while(!hijos.fin() && resultado == null)
		{
			resultado = hijos.proximo().buscar(dato);
		}
		return resultado;
	}
}
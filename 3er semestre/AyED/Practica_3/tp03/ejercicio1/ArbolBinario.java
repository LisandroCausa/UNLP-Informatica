package tp03.ejercicio1;

import tp02.ejercicio3.ColaGenerica;

public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 

	
	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	/*public int contarHojas() {		
		int hijos = 0;
		if(this.tieneHijoIzquierdo())
			hijos += this.getHijoIzquierdo().contarHojas();
		
		if(this.tieneHijoDerecho())
			hijos += this.getHijoDerecho().contarHojas();
		
		return 1 + hijos;
	}*/
	public int contarHojas() {
		if(this.esHoja())
			return 1;
		int izq = 0;
		if(this.tieneHijoIzquierdo())
			izq = this.getHijoIzquierdo().contarHojas();
		
		int der = 0;
		if(this.tieneHijoDerecho())
			der = this.getHijoDerecho().contarHojas();
		
		return izq + der;
	}

    public ArbolBinario<T> espejo() {
		ArbolBinario<T> arbol = new ArbolBinario<T>(this.getDato());
		
    	if(this.tieneHijoIzquierdo())
    		arbol.agregarHijoDerecho(this.getHijoIzquierdo().espejo());
    	
    	if(this.tieneHijoDerecho())
    		arbol.agregarHijoIzquierdo(this.getHijoDerecho().espejo());
    	
		return arbol;
	}


	public void entreNiveles(int n, int m) {
		if(n > m)
			return;
		
		int altura = 0;
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while((cola.esVacia() == false) && (altura <= m))
		{
			ArbolBinario<T> proximoEnCola = cola.desencolar();
			if(proximoEnCola != null)
			{
				if(n <= altura)
					System.out.print(proximoEnCola.getDato() + " ");
				if(proximoEnCola.tieneHijoIzquierdo())
					cola.encolar(proximoEnCola.getHijoIzquierdo());
				if(proximoEnCola.tieneHijoDerecho())
					cola.encolar(proximoEnCola.getHijoDerecho());
			}
			else if(cola.esVacia() == false)
			{
				cola.encolar(null);
				altura++;
			}
		}
		System.out.println();
	}

	

}

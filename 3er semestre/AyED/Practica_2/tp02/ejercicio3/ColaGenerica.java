package tp02.ejercicio3;

import tp02.ejercicio2.*;

public class ColaGenerica<T> {
	private ListaGenerica<T> datos = new ListaEnlazadaGenerica<T>();
	
	public void encolar(T elem) {
		this.datos.agregarFinal(elem);
	}
	
	public T desencolar() {
		T elem = this.tope();
		this.datos.eliminarEn(1);
		return elem;
	}
	
	public T tope() {
		return this.datos.elemento(1);
	}
	
	public boolean esVacia() {
		return this.datos.esVacia();
	}
}

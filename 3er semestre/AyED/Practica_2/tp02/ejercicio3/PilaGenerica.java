package tp02.ejercicio3;

import tp02.ejercicio2.*;

public class PilaGenerica<T> {
	private ListaGenerica<T> datos = new ListaEnlazadaGenerica<T>();
	
	public void apilar(T elem) {
		this.datos.agregarInicio(elem);
	}
	
	public T desapilar() {
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

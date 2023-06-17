package ejercicio5;

import tp02.ejercicio2.*;

public class Minimo {
	private int cargas;
	private ListaGenerica<String> camino;

	
	public Minimo(int cargas, ListaGenerica<String> camino) {
		this.cargas = cargas;
		this.camino = camino;
	}
	
	public ListaGenerica<String> getCamino() {
		return camino;
	}
	public void setCamino(ListaGenerica<String> camino) {
		this.camino = camino;
	}
	public int getCargas() {
		return cargas;
	}
	public void setCargas(int cargas) {
		this.cargas = cargas;
	}
}

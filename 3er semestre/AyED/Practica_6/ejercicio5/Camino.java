package ejercicio5;

import tp02.ejercicio2.*;
//import tp06.ejercicio3.*;

public class Camino {
	private ListaGenerica<String> camino;
	private int costo;
	
	public Camino(ListaGenerica<String> camino, int costo) {
		this.camino = camino;
		this.costo = costo;
	}
	
	public ListaGenerica<String> getCamino() {
		return camino;
	}
	public void setCamino(ListaGenerica<String> camino) {
		this.camino = camino;
	}
	public int getCosto() {
		return costo;
	}
	public void setCosto(int costo) {
		this.costo = costo;
	}
	
	
}

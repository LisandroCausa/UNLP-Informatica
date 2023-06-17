package ejercicio4;

import tp02.ejercicio2.*;
import tp02.ejercicio3.*;
import tp06.ejercicio3.*;

public class Recorridos<T> {
	
	public ListaGenerica<T> dfs(Grafo<T> grafo) {
		ListaGenerica<T> camino = new ListaEnlazadaGenerica<T>();
		int n = grafo.listaDeVertices().tamanio();
		boolean[] visitados = new boolean[n+1];
		for(int i = 1; i <= n; i++) {
			if(!visitados[i]) {
				dfs(grafo.vertice(i), grafo, visitados, camino);
			}
		}
		
		return camino;
	}
	
	private void dfs(Vertice<T> vertice, Grafo<T> grafo, boolean[] visitados, ListaGenerica<T> camino) {
		visitados[vertice.getPosicion()] = true;
		camino.agregarFinal(vertice.dato());
		
		ListaGenerica<Arista<T>> adyacentes = grafo.listaDeAdyacentes(vertice);
		adyacentes.comenzar();
		while(!adyacentes.fin()) {
			Vertice<T> proximo = adyacentes.proximo().verticeDestino();
			if(!visitados[proximo.getPosicion()]) {
				dfs(proximo, grafo, visitados, camino);
			}
		}
	}
	
	public ListaGenerica<T> bfs(Grafo<T> grafo) {
		ListaGenerica<T> camino = new ListaEnlazadaGenerica<T>();
		int n = grafo.listaDeVertices().tamanio();
		boolean[] visitados = new boolean[n+1];
		
		ColaGenerica<Vertice<T>> cola = new ColaGenerica<Vertice<T>>();
		cola.encolar(grafo.vertice(1));
		
		while(!cola.esVacia()) {
			Vertice<T> proximo = cola.desencolar();
			camino.agregarFinal(proximo.dato());
			visitados[proximo.getPosicion()] = true;
			
			ListaGenerica<Arista<T>> adyacentes = grafo.listaDeAdyacentes(proximo);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				Vertice<T> proximoAdyacente = adyacentes.proximo().verticeDestino();
				if(!visitados[proximoAdyacente.getPosicion()]) {
					cola.encolar(proximoAdyacente);
				}
			}
			
			if(cola.esVacia()) {
				int posicionSinRecorrer = -1;
				for(int i = 1; i <= n; i++) {
					if(!visitados[i]) {
						posicionSinRecorrer = i;
						break;
					}
				}
				if(posicionSinRecorrer != -1) {
					cola.encolar(grafo.vertice(posicionSinRecorrer));
				}
			}
		}
		
		return camino;
	}
}

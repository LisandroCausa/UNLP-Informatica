package ejercicio6;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class VisitaOslo {
	
	public ListaGenerica<String> paseoEnBici(Grafo<String> lugares, String destino, int maxTiempo, ListaGenerica<String> lugaresRestringidos) {
		String origen = "Ayuntamiento";
		
		Vertice<String> verticeOrigen = buscarVertice(lugares, origen);

		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		int n = lugares.listaDeVertices().tamanio();
		
		/*int[] grados_in = new int[n+1];
		for(int i = 1; i <= n; i++) {
			ListaGenerica<Arista<String>> adyacentes = lugares.listaDeAdyacentes(lugares.vertice(i));
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				grados_in[adyacentes.proximo().verticeDestino().getPosicion()] += 1;
			}
		}
		dfsMaxDistExcepciones2(verticeOrigen, destino, lugares, grados_in, lugaresRestringidos, maxTiempo, camino);*/
		
		boolean[] visitados = new boolean[n+1];
		dfsMaxDistExcepciones(verticeOrigen, destino, lugares, visitados, lugaresRestringidos, maxTiempo, camino);
		
		return camino;
	}
	
	private Vertice<String> buscarVertice(Grafo<String> grafo, String dato) {
		ListaGenerica<Vertice<String>> vertices = grafo.listaDeVertices();
		vertices.comenzar();
		while(!vertices.fin()) {
			Vertice<String> proximo = vertices.proximo();
			if(proximo.dato().equals(dato))
				return proximo;
		}
		return null;
	}
	
	private boolean dfsMaxDistExcepciones(Vertice<String> vertice, String buscado, Grafo<String> grafo, boolean[] visitados, ListaGenerica<String> lugaresRestringidos, int maxTiempo, ListaGenerica<String> camino) {
		boolean encontrado = false;
		if(visitados[vertice.getPosicion()]) {
			return false;
		}
		visitados[vertice.getPosicion()] = true;
		if(vertice.dato().equals(buscado)) {
			encontrado = true;
		} else if(lugaresRestringidos.incluye(vertice.dato()) == false) {
			ListaGenerica<Arista<String>> adyacentes = grafo.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !encontrado) {
				Arista<String> arista = adyacentes.proximo();
				if(arista.peso() <= maxTiempo) {
					encontrado = dfsMaxDistExcepciones(arista.verticeDestino(), buscado, grafo, visitados, lugaresRestringidos, (maxTiempo-arista.peso()), camino);
				}
			}
		}
		if(encontrado) {
			camino.agregarInicio(vertice.dato());
		}
		return encontrado;
	}
	
	/*private boolean dfsMaxDistExcepciones2(Vertice<String> vertice, String buscado, Grafo<String> grafo, int[] grados_in, ListaGenerica<String> lugaresRestringidos, int maxTiempo, ListaGenerica<String> camino) {
		boolean encontrado = false;
		if(grados_in[vertice.getPosicion()] == 0) {
			return false;
		}
		grados_in[vertice.getPosicion()] -= 1;
		if(vertice.dato().equals(buscado)) {
			encontrado = true;
		} else if(lugaresRestringidos.incluye(vertice.dato()) == false) {
			ListaGenerica<Arista<String>> adyacentes = grafo.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !encontrado) {
				Arista<String> arista = adyacentes.proximo();
				if(arista.peso() <= maxTiempo) {
					encontrado = dfsMaxDistExcepciones2(arista.verticeDestino(), buscado, grafo, grados_in, lugaresRestringidos, (maxTiempo-arista.peso()), camino);
				}
			}
		}
		if(encontrado) {
			camino.agregarInicio(vertice.dato());
		}
		return encontrado;
	}*/
}

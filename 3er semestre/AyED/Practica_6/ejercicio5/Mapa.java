package ejercicio5;

import tp02.ejercicio2.*;
import tp02.ejercicio3.*;
import tp06.ejercicio3.*;

public class Mapa {
	private Grafo<String> mapa;
	
	public Mapa(Grafo<String> mapa) {
		this.mapa = mapa;
	}
	
	public ListaGenerica<String> devolverCamino(String ciudad1, String ciudad2) {
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		
		Vertice<String> verticeCiudad1 = buscarVertice(ciudad1);
		
		boolean[] visitados = new boolean[this.mapa.listaDeVertices().tamanio()];
		
		primerDFS(verticeCiudad1.getPosicion(), camino, ciudad2, visitados);
		
		return camino;
	}
	
	private Vertice<String> buscarVertice(String dato) {
		ListaGenerica<Vertice<String>> vertices = this.mapa.listaDeVertices();
		vertices.comenzar();
		while(!vertices.fin()) {
			Vertice<String> proximo = vertices.proximo();
			if(proximo.dato().equals(dato)) {
				return proximo;
			}
		}
		return null;
	}
	
	private boolean primerDFS(int p, ListaGenerica<String> camino, String buscado, boolean[] visitados) {
		boolean encontrado = false;
		Vertice<String> vertice = this.mapa.vertice(p);
		if(visitados[vertice.getPosicion()])
			return false;
		visitados[vertice.getPosicion()] = true;
			
		if(vertice.dato().equals(buscado)) {
			encontrado = true;
		} else {
			ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !encontrado) {
				Arista<String> proximo = adyacentes.proximo();
				encontrado = primerDFS(proximo.verticeDestino().getPosicion(), camino, buscado, visitados);
			}
		}
		if(encontrado)
			camino.agregarInicio(vertice.dato());
		return encontrado;
	}
	
	public ListaGenerica<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, ListaGenerica<String> ciudades) {
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		
		Vertice<String> verticeCiudad1 = buscarVertice(ciudad1);
		
		boolean[] visitados = new boolean[this.mapa.listaDeVertices().tamanio()];
		
		exceptuandoDFS(verticeCiudad1.getPosicion(), camino, ciudad2, ciudades, visitados);
		
		return camino;
	}
	
	private boolean exceptuandoDFS(int p, ListaGenerica<String> camino, String buscado, ListaGenerica<String> excepciones, boolean[] visitados) {
		boolean encontrado = false;
		Vertice<String> vertice = this.mapa.vertice(p);
		if(visitados[vertice.getPosicion()])
			return false;
		visitados[vertice.getPosicion()] = true;
		if(vertice.dato().equals(buscado)) {
			encontrado = true;
		} else {
			excepciones.comenzar();
			while(!excepciones.fin()) {
				if(vertice.dato().equals(excepciones.proximo())) {
					return false;
				}
			}
			ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !encontrado) {
				Arista<String> proximo = adyacentes.proximo();
				encontrado = exceptuandoDFS(proximo.verticeDestino().getPosicion(), camino, buscado, excepciones, visitados);
			}
		}
		if(encontrado)
			camino.agregarInicio(vertice.dato());
		return encontrado;
	}
	
	public ListaGenerica<String> caminoMasCorto(String ciudad1, String ciudad2) {
		Vertice<String> verticeOrigen = buscarVertice(ciudad1);
		Vertice<String> verticeDestino = buscarVertice(ciudad2);
		
		int n = this.mapa.listaDeVertices().tamanio();
		int[] D = new int[n+1];
		int[] P = new int [n+1];
		DijkstraAciclico(D, P, verticeOrigen.getPosicion());
		
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		int i = verticeDestino.getPosicion();
		while(P[i] != 0) {
			camino.agregarInicio(this.mapa.vertice(i).dato());
			i = P[i];
		}
		camino.agregarInicio(this.mapa.vertice(i).dato());
		
		return camino;
	}
	
	private void Dijkstra(int[] D, int[] P, int origen) {
		int n = this.mapa.listaDeVertices().tamanio();
		boolean[] visitado = new boolean[n+1];
		
		for(int i = 1; i <= n; i++) {
			D[i] = 99999;
			P[i] = 0;
		}
		D[origen] = 0;
		
		for(int i = 1; i <= n; i++) {
			int minIndice = -1;
			int minD = Integer.MAX_VALUE;
			for(int j = 1; j <= n; j++) {
				if(visitado[j] == false && D[j] < minD) {
					minIndice = j;
					minD = D[minIndice];
				}
			}
			visitado[minIndice] = true;
			Vertice<String> vertice = this.mapa.vertice(minIndice);
			ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				Arista<String> arista = adyacentes.proximo();
				int proximo = arista.verticeDestino().getPosicion();
				if(visitado[proximo] == false) {
					if(D[proximo] > D[minIndice] + arista.peso()) {
						D[proximo] = D[minIndice] + arista.peso();
						P[proximo] = minIndice;
					}
				}
			}
		}
	}
	
	private int[] grados_in() {
		int n = this.mapa.listaDeVertices().tamanio();
		int[] array = new int[n+1];
		for(int i = 1; i <= n; i++) {
			ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(this.mapa.vertice(i));
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				array[adyacentes.proximo().verticeDestino().getPosicion()] += 1;
			}
		}
		return array;
	}
	
	private void DijkstraAciclico(int[] D, int[] P, int origen) {
		int n = this.mapa.listaDeVertices().tamanio();
		int[] in = grados_in();
		ColaGenerica<Vertice<String>> cola = new ColaGenerica<Vertice<String>>();
		for(int i = 1; i <= n; i++) {
			if(in[i] == 0) {
				cola.encolar(this.mapa.vertice(i));
			}
			D[i] = 9999;
			P[i] = 0;
		}
		D[origen] = 0;
		while(!cola.esVacia()) {
			Vertice<String> proximo = cola.desencolar();
			ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(proximo);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				Arista<String> arista = adyacentes.proximo();
				int w = arista.verticeDestino().getPosicion();
				in[w] -= 1;
				if(in[w] == 0) {
					cola.encolar(this.mapa.vertice(w));
				}
				if(D[proximo.getPosicion()] != 9999) {
					if(D[w] > D[proximo.getPosicion()] + arista.peso()) {
						D[w] = D[proximo.getPosicion()] + arista.peso();
						P[w] = proximo.getPosicion();
					}
				}
			}
		}
	}
	
	public ListaGenerica<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		Vertice<String> verticeOrigen = buscarVertice(ciudad1);
		Vertice<String> verticeDestino = buscarVertice(ciudad2);
		
		int n = this.mapa.listaDeVertices().tamanio();
		int[] D = new int[n+1];
		int[] P = new int[n+1];
		DijkstraAciclico(D, P, verticeOrigen.getPosicion());
		
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		int i = verticeDestino.getPosicion();
		if(D[i] <= tanqueAuto) {
			while(i != 0) {
				camino.agregarInicio(this.mapa.vertice(i).dato());
				i = P[i];
			}
			if(tanqueAuto < 0) {
				while(!camino.esVacia()) {
					camino.eliminarEn(1);
				}
			}
		}
		
		return camino;
	}
	
	public ListaGenerica<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		
		Vertice<String> origen = buscarVertice(ciudad1);
		
		boolean[] visitados = new boolean[this.mapa.listaDeVertices().tamanio()+1];
		Minimo min = dfsMenorCargas(origen.getPosicion(), ciudad2, tanqueAuto, tanqueAuto, 0, 9999, visitados);
		
		return min.getCamino();
	}

	private Minimo dfsMenorCargas(int p, String buscado, int tanqueActual, int tanqueMax, int cargasActual, int cargasMin, boolean[] visitados) {
		  if(visitados[p] || cargasActual >= cargasMin) {
		    return null;
		  }
		  visitados[p] = true;
		  Minimo minimo = new Minimo(9999, (new ListaEnlazadaGenerica<String>()));
		  if(this.mapa.vertice(p).dato().equals(buscado)) {
		    minimo.setCargas(cargasActual);
		  } else {
		    ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(this.mapa.vertice(p));
		    adyacentes.comenzar();
		    
		    while(!adyacentes.fin() && cargasMin > 0) {
		      Arista<String> arista = adyacentes.proximo();
		      int peso = arista.peso();
		      int cargasArista = cargasActual;
		      int tanqueArista = tanqueActual;
		      if(peso <= tanqueMax) {
		        if(peso > tanqueArista) {
		          tanqueArista = tanqueMax - peso;
		          cargasArista++;
		        }
		        Minimo res = dfsMenorCargas(arista.verticeDestino().getPosicion(), buscado, tanqueArista, tanqueMax, cargasArista, cargasMin, visitados);
		      	if(res != null && res.getCargas() < minimo.getCargas()) {
		          minimo = res;
		          cargasMin = minimo.getCargas();
		        }
		      }
		    }
		  }
		  visitados[p] = false;
		  if(minimo != null) {
			  minimo.getCamino().agregarInicio(this.mapa.vertice(p).dato());
		  }
		  return minimo;
	}
	
	
	/*private int dfsMenorCantCargas(int p, ListaGenerica<String> camino, String buscado, boolean[] visitados, int cargasHechas, int tanqueActual, int tanqueMax) {
	boolean encontrado = false;
	int minCargas = Integer.MAX_VALUE;
	if(visitados[p]) {
		return Integer.MAX_VALUE;
	}
	visitados[p] = true;
	Vertice<String> vertice = this.mapa.vertice(p);
	if(vertice.dato().equals(buscado)) {
		encontrado = true;
	} else {
		ListaGenerica<Arista<String>> adyacentes = this.mapa.listaDeAdyacentes(vertice);
		adyacentes.comenzar();
		while(!adyacentes.fin()) {
			Arista<String> arista = adyacentes.proximo();
			if(arista.peso() <= tanqueMax) {
				int cargasArista = cargasHechas;
				int tanqueArista = tanqueActual;
				if(arista.peso() > tanqueArista) {
					tanqueArista = tanqueMax - arista.peso();
					cargasArista++;
				}
				int res = dfsMenorCantCargas(arista.verticeDestino().getPosicion(), camino, buscado, visitados, cargasArista, tanqueArista, tanqueMax);
				if(res < minCargas) {
					minCargas = res;
					//camino =
				}
			}
		}
	}

	return minCargas;
}*/
}

package ejercicio4;

import tp02.ejercicio2.*;
import tp06.ejercicio3.*;

public class Main {

	public static void main(String[] args) {
		Grafo<String> grafo = new GrafoImplListAdy<String>();
		Vertice<String> v1 = new VerticeImplListAdy<String>("D");
		Vertice<String> v2 = new VerticeImplListAdy<String>("C");
		Vertice<String> v3 = new VerticeImplListAdy<String>("H");
		Vertice<String> v4 = new VerticeImplListAdy<String>("B");
		Vertice<String> v5 = new VerticeImplListAdy<String>("R");
		Vertice<String> v6 = new VerticeImplListAdy<String>("T");
		Vertice<String> v7 = new VerticeImplListAdy<String>("A");
		
		grafo.agregarVertice(v1);
		grafo.agregarVertice(v2);
		grafo.agregarVertice(v3);
		grafo.agregarVertice(v4);
		grafo.agregarVertice(v5);
		grafo.agregarVertice(v6);
		grafo.agregarVertice(v7);
		
		grafo.conectar(v1, v2);
		grafo.conectar(v1, v3);
		grafo.conectar(v1, v4);
		grafo.conectar(v2, v5);
		grafo.conectar(v5, v3);
		grafo.conectar(v4, v3);
		grafo.conectar(v3, v6);
		grafo.conectar(v3, v7);
		
		Recorridos<String> recorridos = new Recorridos<String>();
		
		System.out.println("--- Se imprime el GRAFO con DFS ---");
		ListaGenerica<String> lis = recorridos.dfs(grafo);
		lis.comenzar();
		while(!lis.fin()) {
			System.out.print(lis.proximo() + " ");
		}
		System.out.println();
		System.out.println();
		System.out.println("--- Se imprime el GRAFO con BFS ---");
		ListaGenerica<String> lis2 = recorridos.bfs(grafo);
		lis2.comenzar();
		while(!lis2.fin()) {
			System.out.print(lis2.proximo() + " ");
		}
	}

}

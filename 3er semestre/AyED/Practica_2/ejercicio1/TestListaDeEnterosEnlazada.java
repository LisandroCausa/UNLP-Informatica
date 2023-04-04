package ejercicio1;

import tp02.ejercicio1.ListaDeEnterosConArreglos;
import tp02.ejercicio1.ListaDeEnterosEnlazada;

public class TestListaDeEnterosEnlazada {

	public static void main(String[] args) {
		ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
		for(String arg : args)
		{
			lista.agregarFinal(Integer.parseInt(arg));
		}
		lista.comenzar();
		while(!lista.fin())
		{
			System.out.print(lista.proximo() + " ");
		}
		System.out.println("FIN");
		imprimirInverso(lista, lista.tamanio());
	}
	
	public static void imprimirInverso(ListaDeEnterosEnlazada lista, int indice) {
		System.out.println(lista.elemento(indice));
		if(indice > 1)
			imprimirInverso(lista, indice-1);
	}

}

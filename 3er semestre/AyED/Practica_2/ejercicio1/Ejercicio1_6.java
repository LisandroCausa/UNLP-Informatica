package ejercicio1;

import tp02.ejercicio1.*;

public class Ejercicio1_6 {

	public static void main(String[] args) {
		Ejercicio1_6 f = new Ejercicio1_6();
		ListaDeEnterosEnlazada L = f.calcularSucesion(4);
		L.comenzar();
		while(!L.fin())
		{
			System.out.print(L.proximo() + " ");
		}
		System.out.println();
	}
	
	public ListaDeEnterosEnlazada calcularSucesion(int n) {
		ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
		lista.agregarFinal(n);
		if(n == 1)
			return lista;
		
		int resultado;
		if(n % 2 == 0)
			resultado = n / 2;
		else
			resultado = (3 * n) + 1;

		ListaDeEnterosEnlazada listaSiguientes = calcularSucesion(resultado);
		listaSiguientes.comenzar();
		while(!listaSiguientes.fin())
		{
			int proximo = listaSiguientes.proximo();
			lista.agregarFinal(proximo);
		}
		return lista;
	}

}

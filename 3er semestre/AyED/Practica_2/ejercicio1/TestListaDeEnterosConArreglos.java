package ejercicio1;

import tp02.ejercicio1.*;

public class TestListaDeEnterosConArreglos {

	public static void main(String[] args) {
		ListaDeEnterosConArreglos lista = new ListaDeEnterosConArreglos();
		for(String arg : args)
		{
			lista.agregarFinal(Integer.parseInt(arg));
		}
		lista.comenzar();
		while(!lista.fin())
		{
			System.out.print(lista.proximo() + " ");
		}
	}

}

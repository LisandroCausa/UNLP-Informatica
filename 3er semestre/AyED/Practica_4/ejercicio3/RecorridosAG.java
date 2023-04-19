package ejercicio3;

import tp02.ejercicio2.*;
import tp02.ejercicio3.ColaGenerica;
import tp04.ejercicio1.ArbolGeneral;

public class RecorridosAG {
	
	private static boolean esPar(Integer numero) {
		return (numero % 2 == 0);
	}
	
	public ListaGenerica<Integer> numerosImparesMayoresQuePreOrden(ArbolGeneral<Integer> a, Integer n) {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		if(esPar(a.getDato()) == false && a.getDato() > n)
			lista.agregarInicio(a.getDato());
		
		if(a.tieneHijos() == false)
			return lista;
		
		ListaGenerica<ArbolGeneral<Integer>> hijos = a.getHijos();
		hijos.comenzar();
		while(!hijos.fin())
		{
			ListaGenerica<Integer> listaHijo = numerosImparesMayoresQuePreOrden(hijos.proximo(), n);
			listaHijo.comenzar();
			while(!listaHijo.fin())
			{
				lista.agregarFinal(listaHijo.proximo());
			}
		}
		
		return lista;
	}
	
	/*public ListaGenerica<Integer> numerosImparesMayoresQueInOrden(ArbolGeneral<Integer> a, Integer n) {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		if(a.tieneHijos())
		{
			ArbolGeneral<Integer> primerHijo = a.getHijos().elemento(1);
			ListaGenerica<Integer> listaPrimerHijo = numerosImparesMayoresQueInOrden(primerHijo, n);
			listaPrimerHijo.comenzar();
			while(!listaPrimerHijo.fin())
			{
				lista.agregarFinal(listaPrimerHijo.proximo());
			}
			//a.getHijos().eliminarEn(1);
		}
		
		if(esPar(a.getDato()) == false && a.getDato() > n)
			lista.agregarFinal(a.getDato());
		
		if(a.tieneHijos() == false)
			return lista;
		
		ListaGenerica<ArbolGeneral<Integer>> hijosRestantes = a.getHijos();
		hijosRestantes.comenzar();
		hijosRestantes.proximo(); // se descarta primer elemento
		while(!hijosRestantes.fin())
		{
			ListaGenerica<Integer> listaHijo = numerosImparesMayoresQueInOrden(hijosRestantes.proximo(), n);
			listaHijo.comenzar();
			while(!listaHijo.fin())
			{
				lista.agregarFinal(listaHijo.proximo());
			}
		}
		
		return lista;
	}*/
	
	public ListaGenerica<Integer> numerosImparesMayoresQueInOrden(ArbolGeneral<Integer> a, Integer n) {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		ListaGenerica<ArbolGeneral<Integer>> hijos = null;
		// procesar primer hijo
		if(a.tieneHijos())
		{
			hijos = a.getHijos();
			hijos.comenzar();
			ListaGenerica<Integer> listaPrimerHijo = numerosImparesMayoresQueInOrden(hijos.proximo(), n);
			listaPrimerHijo.comenzar();
			while(!listaPrimerHijo.fin())
			{
				lista.agregarFinal(listaPrimerHijo.proximo());
			}
			
		}
		
		// procesar nodo padre
		if(esPar(a.getDato()) == false && a.getDato() > n)
			lista.agregarFinal(a.getDato());
		
		// seguir procesando hijos restantes
		if(a.tieneHijos())
		{
			while(!hijos.fin())
			{
				ListaGenerica<Integer> listaHijo = numerosImparesMayoresQueInOrden(hijos.proximo(), n);
				listaHijo.comenzar();
				while(!listaHijo.fin())
				{
					lista.agregarFinal(listaHijo.proximo());
				}
			}
		}
		
		return lista;
	}
	
	public ListaGenerica<Integer> numerosImparesMayoresQuePostOrden(ArbolGeneral<Integer> a, Integer n) {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		
		if(a.tieneHijos())
		{
			ListaGenerica<ArbolGeneral<Integer>> hijos = a.getHijos();
			hijos.comenzar();
			while(!hijos.fin())
			{
				ListaGenerica<Integer> listaHijo = numerosImparesMayoresQuePostOrden(hijos.proximo(), n);
				listaHijo.comenzar();
				while(!listaHijo.fin())
				{
					lista.agregarFinal(listaHijo.proximo());
				}
			}
		}
		
		if(esPar(a.getDato()) == false && a.getDato() > n)
			lista.agregarFinal(a.getDato());
		
		return lista;
	}
	
	public ListaGenerica<Integer> numerosImparesMayoresQuePorNiveles(ArbolGeneral<Integer> a, Integer n) {
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		ColaGenerica<ArbolGeneral<Integer>> cola = new ColaGenerica<ArbolGeneral<Integer>>();
		
		cola.encolar(a);
		while(!cola.esVacia())
		{
			ArbolGeneral<Integer> proximo = cola.desencolar();
			if(proximo != null)
			{
				if(esPar(proximo.getDato()) == false && proximo.getDato() > n)
					lista.agregarFinal(proximo.getDato());
				
				ListaGenerica<ArbolGeneral<Integer>> hijos = proximo.getHijos();
				hijos.comenzar();
				while(!hijos.fin())
				{
					cola.encolar(hijos.proximo());
				}
			}
			else if(!cola.esVacia())
			{
				cola.encolar(null);
			}	
		}
		return lista;
	}
}

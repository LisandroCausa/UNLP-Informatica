package ejercicio5;

import tp04.ejercicio1.*;
import tp02.ejercicio2.*;
import tp02.ejercicio3.ColaGenerica;

public class AnalizadorArbol {
	public int devolverMaximoPromedio(ArbolGeneral<AreaEmpresa> arbol) {
		int maximoPromedio = Integer.MIN_VALUE;
		int suma = 0;
		int cantNivelActual = 0;
		ColaGenerica<ArbolGeneral<AreaEmpresa>> cola = new ColaGenerica<ArbolGeneral<AreaEmpresa>>();
		cola.encolar(arbol);
		cola.encolar(null);
		while(!cola.esVacia())
		{
			ArbolGeneral<AreaEmpresa> proximo = cola.desencolar();
			if(proximo != null)
			{
				cantNivelActual++;
				suma += proximo.getDato().getTardanza();
				ListaGenerica<ArbolGeneral<AreaEmpresa>> hijos = proximo.getHijos();
				hijos.comenzar();
				while(!hijos.fin())
				{
					cola.encolar(hijos.proximo());
				}
			}
			else if(!cola.esVacia())
			{
				int nuevoPromedio = (suma / cantNivelActual);
				if(nuevoPromedio > maximoPromedio)
					maximoPromedio = nuevoPromedio;
				suma = 0;
				cantNivelActual = 0;
				cola.encolar(null);
			}
		}
		// procesar ultimo nivel
		int nuevoPromedio = (suma / cantNivelActual);
		if(nuevoPromedio > maximoPromedio)
			maximoPromedio = nuevoPromedio;
		
		return maximoPromedio;
	}
}

package ejercicio7;

import tp04.ejercicio1.*;
import tp02.ejercicio2.*;

public class RedDeAguaPotable {
	
	private ArbolGeneral<String> arbol;
	
	public RedDeAguaPotable(ArbolGeneral<String> arbol) {
		this.arbol = arbol;
	}
	
	public double minimoCaudal(double caudal) {
		return this.minimoCaudalPRIVATE(this.arbol, caudal);
	}
	
	private double minimoCaudalPRIVATE(ArbolGeneral<String> arbol, double caudal) {
		double minimo = caudal;
		if(!arbol.esHoja())
		{
			ListaGenerica<ArbolGeneral<String>> hijos = arbol.getHijos();
			double caudalHijos = (caudal / hijos.tamanio());
			hijos.comenzar();
			while(!hijos.fin())
			{
				minimo = Math.min(minimo, minimoCaudalPRIVATE(hijos.proximo(), caudalHijos));
			}
		}
		return minimo;
	}
}

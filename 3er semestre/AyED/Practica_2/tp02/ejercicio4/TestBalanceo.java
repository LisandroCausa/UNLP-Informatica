package tp02.ejercicio4;

import tp02.ejercicio3.*;

public class TestBalanceo {
	
	public static void main(String[] args) {
		System.out.println(estaBalanceado("{( ) [ ( ) ] }"));
		System.out.println(estaBalanceado("( [ ) ]"));
	}
	
	
	public static boolean estaBalanceado(String str) {
		PilaGenerica<Character> pilaAperturas = new PilaGenerica<Character>();
		for(int i = 0; i < str.length(); i++)
		{
			char c = str.charAt(i);
			if(tipoApertura(c) != -1)
			{
				pilaAperturas.apilar(c);
			}
			else if(tipoCierre(c) != -1)
			{
				char aperturaCorrespondiente = pilaAperturas.desapilar();
				if(tipoApertura(aperturaCorrespondiente) != tipoCierre(c))
					return false;
			}
		}
		return pilaAperturas.esVacia();
	}
	
	private static int tipoApertura(char c) {
		char[] tiposAperturas = {'{', '(', '['};
		for(int i = 0; i < tiposAperturas.length; i++)
		{
			if(c == tiposAperturas[i])
				return i;
		}
		return -1;
	}
	
	private static int tipoCierre(char c) {
		char[] tiposCierres = {'}', ')', ']'};
		for(int i = 0; i < tiposCierres.length; i++)
		{
			if(c == tiposCierres[i])
				return i;
		}
		return -1;
	}
}

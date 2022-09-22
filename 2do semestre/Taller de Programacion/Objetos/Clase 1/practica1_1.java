package clase1;
import PaqueteLectura.GeneradorAleatorio;

public class practica1_1 {
	public static void main(String[] args) {
		PaqueteLectura.GeneradorAleatorio.iniciar();
		int DF = 11;
		int[] tabla = new int[DF];
		for(int i = 0; i < DF; i++)
			tabla[i] = i * 2;

		int entrada = PaqueteLectura.GeneradorAleatorio.generarInt(DF+1);
		while(entrada != DF)
		{
			System.out.println(tabla[entrada]);
			entrada = PaqueteLectura.GeneradorAleatorio.generarInt(DF+1);
		}
	}
	
}

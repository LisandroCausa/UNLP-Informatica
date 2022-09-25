package clase1;
import PaqueteLectura.Lector;

public class practica1_2 {
	public static void main(String[] args)
	{
		double[] alturas = new double[15];
		double sumaAlturas = 0;
		for(int i = 0; i < alturas.length; i++)
		{
			alturas[i] = PaqueteLectura.Lector.leerDouble();
			sumaAlturas += alturas[i];
		}
		double promedioAltura = sumaAlturas / alturas.length;
		System.out.println("Promedio = " + promedioAltura);
		int cantEncimaPromedio = 0;
		for(int i = 0; i < alturas.length; i++)
		{
			if(alturas[i] > promedioAltura)
				cantEncimaPromedio++;
		}
		System.out.print("Cantidad de jugadores con altura por encima del promedio: ");
		System.out.println(cantEncimaPromedio);
	}
}
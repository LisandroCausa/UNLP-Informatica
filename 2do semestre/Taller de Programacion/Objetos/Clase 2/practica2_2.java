package clase2;
import PaqueteLectura.*;

public class practica2_2 {
	public static void main(String[] args)
	{
		PaqueteLectura.GeneradorAleatorio.iniciar();
		Persona[] gente = new Persona[15];
		int dimL = 0;
		
		Persona aux;
		aux = leerPersona();
		while(aux.getEdad() != 0 && dimL < gente.length)
		{
			gente[dimL] = aux; // lo agrega al vector
			dimL++;
			aux = leerPersona();
		}
		
		int cantidadMayor65 = 0;
		Persona menorDNI = gente[0];
		for(int i = 0; i < dimL; i++)
		{
			if(gente[i].getEdad() > 65)
				cantidadMayor65++;
			
			if(gente[i].getDNI() < menorDNI.getDNI())
				menorDNI = gente[i];
		}
		System.out.println("Cantidad de personas mayores de 65 años: " + cantidadMayor65);
		System.out.println(menorDNI.toString()); // Persona menor DNI
	}
	
	public static Persona leerPersona()
	{
		Persona p = new Persona();
		int longitud = PaqueteLectura.GeneradorAleatorio.generarInt(10)+1;
		p.setNombre(PaqueteLectura.GeneradorAleatorio.generarString(longitud));
		p.setDNI(PaqueteLectura.GeneradorAleatorio.generarInt(1000));
		p.setEdad(PaqueteLectura.GeneradorAleatorio.generarInt(100));
		return p;
	}
}

package clase2;
import PaqueteLectura.Lector;

public class practica2_1 {
	public static void main(String[] args) {
		Persona p = new Persona();
		p.setNombre(PaqueteLectura.Lector.leerString());
		p.setDNI(PaqueteLectura.Lector.leerInt());
		p.setEdad(PaqueteLectura.Lector.leerInt());
		System.out.println(p.toString());
	}
}

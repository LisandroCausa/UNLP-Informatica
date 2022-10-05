package clase4;

public class practica4_2 {
	public static void main(String[] args) {
		Jugador manuel = new Jugador(32, 11, "Manuel", 12400, 3);
		Entrenador jorge = new Entrenador(2, "Jorge", 8000, 9);
		System.out.println(manuel);
		System.out.println("Sueldo a cobrar: " + manuel.calcularSueldoACobrar());
		System.out.println();
		System.out.println(jorge);
		System.out.println("Sueldo a cobrar: " + jorge.calcularSueldoACobrar());
	}
}

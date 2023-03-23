package ejercicio5;

public class Main {

	public static void main(String[] args) {
		int[] array = {5, 7, 2, 3, 10};
		Estadistica a = Calculador.puntoA(array);
		Estadistica b = new Estadistica();
		Calculador.puntoB(array, b);
		Calculador.puntoC(array);
		Estadistica c = Calculador.estadistica;
		System.out.println();
	}

}

package ejercicio1;

public class Main {

	public static void main(String[] args) {
		int a = Integer.valueOf(args[0]);
		int b = Integer.valueOf(args[1]);
		Iterador.iterarFor(a, b);
		Iterador.iterarWhile(a, b);
		Iterador.iterarRecursivo(a, b);
	}

}

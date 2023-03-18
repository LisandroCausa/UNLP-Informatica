package ejercicio1;

public class Iterador {
	public static void iterarFor(int a, int b) {
		for(int i = a; i <= b; i++)
		{
			System.out.println(i);
		}
	}
	
	public static void iterarWhile(int a, int b) {
		int i = a;
		while(i <= b)
		{
			System.out.println(i);
			i++;
		}
	}
	
	public static void iterarRecursivo(int a, int b) {
		System.out.println(a);
		if(a < b)
		{
			iterarRecursivo(a+1, b);
		}
	}
}

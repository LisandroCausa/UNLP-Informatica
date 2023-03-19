package ejercicio2;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int[] resultado = multiplos(scanner.nextInt());
		imprimirArreglo(resultado);
	}
	
	public static int[] multiplos(int n) {
		int[] array = new int[n];
		for(int i = 0; i < n; i++)
		{
			array[i] = n * (i + 1);
		}
		return array;
	}

	public static void imprimirArreglo(int[] array) {
		for(int i = 0; i < array.length; i++)
		{
			System.out.print(array[i] + " ");
		}
		System.out.println();
	}
}

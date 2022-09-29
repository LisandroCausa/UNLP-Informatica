package clase1;
import PaqueteLectura.*;

public class practica1_3 {
	public static void main(String[] args) {
		PaqueteLectura.GeneradorAleatorio.iniciar();
		int suma = 0;
		int N = 5;
		int fila = -1;
		int colum = -1;
		int[] vector = new int[N];
		int[][] matriz = new int[N][N];
		
		for(int i = 0; i < 5; i++)
		{
			for(int b = 0; b < 5; b++)
			{
				matriz[i][b] = PaqueteLectura.GeneradorAleatorio.generarInt(31);              
			}
		}
		
		for(int i = 0; i < 5; i++)
		{
			for(int b = 0; b < 5; b++)
			{
				System.out.print(matriz[i][b] + " ");
			}
			System.out.println();
		}
		
		for(int b = 0; b < 5; b++)
			suma += matriz[0][b];
		System.out.println("Suma de fila 1: " + suma);
		
		for(int i = 0; i < N; i++)
		{
			int sumaColumna = 0;
			for(int y = 0; y < N; y++)
			{
				sumaColumna += matriz[y][i];
			}
			vector[i] = sumaColumna;
		}
		System.out.print("Vector: ");
		for(int i = 0; i < N; i++)
			System.out.print(vector[i] + " ");
		System.out.println();
		
		int valor = PaqueteLectura.Lector.leerInt();
		for(int i = 0; i < 5; i++)
		{
			for(int b = 0; b < 5; b++)
			{
				if(matriz[i][b] == valor)
				{
					fila = i;
					colum = b;
				}
			}
		}
		if(fila != -1 && colum != -1)
		{
			// se incrementa por uno para contar
			// filas a partir de 1 en vez de 0
			// (Decisión de diseño únicamente)
			System.out.println("Columna: " + (colum+1));
			System.out.println("Fila: " + (fila+1));
		}
		else
		{
			System.out.println("No se encontró el valor " + valor + " en la matriz.");
		}
	}

}
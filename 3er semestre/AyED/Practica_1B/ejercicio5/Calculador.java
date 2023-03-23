package ejercicio5;

public class Calculador {
	public static Estadistica estadistica;
	
	public static Estadistica puntoA(int[] array) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		float promedio = 0;
		long suma = 0;
		
		for(int i = 0; i < array.length; i++)
		{
			if(array[i] < min)
				min = array[i];
			if(array[i] > max)
				max = array[i];
			suma += array[i];
		}
		
		Estadistica estadistica = new Estadistica();
		estadistica.setMin(min);
		estadistica.setMax(max);
		if(array.length > 0)
			promedio = ((float)suma / array.length);
		estadistica.setPromedio(promedio);
		return estadistica;
	}
	
	public static void puntoB(int[] array, Estadistica estadistica) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		float promedio = 0;
		long suma = 0;
		
		for(int i = 0; i < array.length; i++)
		{
			if(array[i] < min)
				min = array[i];
			if(array[i] > max)
				max = array[i];
			suma += array[i];
		}
		
		estadistica.setMin(min);
		estadistica.setMax(max);
		if(array.length > 0)
			promedio = ((float)suma / array.length);
		estadistica.setPromedio(promedio);
	}
	
	public static void puntoC(int[] array) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		float promedio = 0;
		long suma = 0;
		
		for(int i = 0; i < array.length; i++)
		{
			if(array[i] < min)
				min = array[i];
			if(array[i] > max)
				max = array[i];
			suma += array[i];
		}
		
		Calculador.estadistica = new Estadistica();
		Calculador.estadistica.setMin(min);
		Calculador.estadistica.setMax(max);
		if(array.length > 0)
			promedio = ((float)suma / array.length);
		Calculador.estadistica.setPromedio(promedio);
	}
}

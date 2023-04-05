package ejercicio2;

import tp02.ejercicio2.*;
import ejercicio3.Estudiante;

public class TestListaEnlazadaGenerica {

	public static void main(String[] args) {
		ListaEnlazadaGenerica<Estudiante> L = new ListaEnlazadaGenerica<Estudiante>();
		Estudiante estudiante = new Estudiante();
		estudiante.setNombre("Martina");
		estudiante.setApellido("Fernández");
		estudiante.setComision("B");
		estudiante.setEmail("mfernandez@ejemplo.com");
		estudiante.setDireccion("Calle San Martín 1234, Ciudad Autónoma de Buenos Aires");
		L.agregarInicio(estudiante);
		
		estudiante = new Estudiante();
		estudiante.setNombre("Matías");
		estudiante.setApellido("Gómez");
		estudiante.setComision("C");
		estudiante.setEmail("mgomez@ejemplo.com");
		estudiante.setDireccion("Calle 63 789, La Plata, Buenos Aires");
		L.agregarFinal(estudiante);
		
		estudiante = new Estudiante();
		estudiante.setNombre("Valentina");
		estudiante.setApellido("Martínez");
		estudiante.setComision("E");
		estudiante.setEmail("vmartinez@ejemplo.com");
		estudiante.setDireccion("Calle San Luis 4321, Mendoza, Mendoza");
		//L.agregarInicio(estudiante);
		Estudiante[] arrayEstudiantes = new Estudiante[2];
		arrayEstudiantes[0] = estudiante;
		
		estudiante = new Estudiante();
		estudiante.setNombre("Lucas");
		estudiante.setApellido("Díaz");
		estudiante.setComision("F");
		estudiante.setEmail("ldiaz@ejemplo.com");
		estudiante.setDireccion("Avenida Belgrano 555, Salta, Salta");
		//L.agregarEn(estudiante, 3);
		arrayEstudiantes[1] = estudiante;
		L.agregar(arrayEstudiantes);
		
		L.comenzar();
		while(!L.fin())
		{
			Estudiante elemento = L.proximo();
			System.out.println(elemento.tusDatos());
		}
		System.out.println("FIN.");
	}

}

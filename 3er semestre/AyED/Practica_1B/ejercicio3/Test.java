package ejercicio3;

public class Test {

	public static void main(String[] args) {
		Estudiante[] estudiantes = new Estudiante[2];
		Profesor[] profesores = new Profesor[3];
		estudiantes[0] = new Estudiante();
		estudiantes[0].setNombre("Lucía");
		estudiantes[0].setApellido("Gómez");
		estudiantes[0].setComision("3B");
		estudiantes[0].setEmail("luciagomez3B@ejemplo.com");
		estudiantes[0].setDireccion("Av. Corrientes 1234, Ciudad Autónoma de Buenos Aires");

		estudiantes[1] = new Estudiante();
		estudiantes[1].setNombre("Matías");
		estudiantes[1].setApellido("Fernández");
		estudiantes[1].setComision("2A");
		estudiantes[1].setEmail("matiasfernandez2A@ejemplo.com");
		estudiantes[1].setDireccion("Calle San Martín 567, Rosario, Santa Fe");
		
		profesores[0] = new Profesor();
		profesores[0].setNombre("Ana");
		profesores[0].setApellido("Rodríguez");
		profesores[0].setEmail("ana.rodriguez@ejemplo.com");
		profesores[0].setCatedra("Historia Argentina");
		profesores[0].setFacultad("Facultad de Humanidades y Artes");
		
		profesores[1] = new Profesor();
		profesores[1].setNombre("Juan");
		profesores[1].setApellido("González");
		profesores[1].setEmail("juan.gonzalez@ejemplo.com");
		profesores[1].setCatedra("Física I");
		profesores[1].setFacultad("Facultad de Ciencias Exactas, Ingeniería y Agrimensura");
		
		profesores[2] = new Profesor();
		profesores[2].setNombre("Sofía");
		profesores[2].setApellido("Fernández");
		profesores[2].setEmail("sofia.fernandez@ejemplo.com");
		profesores[2].setCatedra("Marketing Digital");
		profesores[2].setFacultad("Facultad de Ciencias Económicas y Empresariales");
		
		for(Estudiante estudiante : estudiantes)
		{
			System.out.println(estudiante.tusDatos());
		}
		System.out.println();
		for(Profesor profesor : profesores)
		{
			System.out.println(profesor.tusDatos());
		}
	}

}

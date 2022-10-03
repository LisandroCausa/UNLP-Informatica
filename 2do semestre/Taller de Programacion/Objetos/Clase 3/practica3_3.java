package clase3;

public class practica3_3 {
	public static void main(String[] args) {
		Estante biblioteca = new Estante();
		
		Autor autor1 = new Autor();
		autor1.setNombre("Herbert Schildt");
		autor1.setBiografia("bla bla bla bla bla");
		autor1.setOrigen("USA");
		Libro libro1 = new Libro( "Java: A Beginner's Guide",   
								 "Mcgraw-Hill", 2014,   
								 autor1, "978-0071809252", 21.72);
		
		Autor autor2 = new Autor();
		autor2.setNombre("John Horton");
		autor2.setBiografia("blo blo blo blo blo");
		autor2.setOrigen("UK");
		Libro libro2 = new Libro("Learning Java by Building Android Games",
							  "CreateSpace Independent Publishing", 
							   autor2, "978-1512108347");
		
		Autor autor3 = new Autor();
		autor3.setNombre("Louisa May Alcott");
		autor3.setBiografia("Fue una escritora estadounidense, reconocida por su famosa novela Mujercitas (1868)");
		autor3.setOrigen("USA");
		Libro libro3 = new Libro("Mujercitas", "?", 1868, autor3, "385-4858356466", 17.50);
		
		biblioteca.agregarLibro(libro1);
		biblioteca.agregarLibro(libro3);
		biblioteca.agregarLibro(libro2);
		System.out.println(biblioteca.libroConTitulo("Mujercitas").getPrimerAutor());
	}
}

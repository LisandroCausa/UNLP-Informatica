package clase4;

public class practica4_3 {
	public static void main(String[] args) {
		Persona p = new Persona();
		p.setNombre("Mauro");
		p.setDNI(11203737);
		p.setEdad(70);
		
		Trabajador t = new Trabajador("chef");
		t.setNombre("Esteban");
		t.setDNI(53046564);
		t.setEdad(47);
		System.out.println(p);
		System.out.println(t);
	}
}

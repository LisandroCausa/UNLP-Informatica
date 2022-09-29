package clase2;

public class Persona {
	private String nombre;
	private int DNI;
	private int edad;
	
	public Persona()
	{
	}
	
	public int getDNI()
	{
		return DNI;
	}
	
	public String getNombre()
	{
		return nombre;
	}
	
	public int getEdad()
	{
		return edad;
	}
	
	public void setNombre(String nom)
	{
		nombre = nom;
	}
	
	public void setDNI(int dni)
	{
		DNI = dni;
	}
	
	public void setEdad(int e)
	{
		edad = e;
	}
	
	public String toString()
	{
		return "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años";
	}
}
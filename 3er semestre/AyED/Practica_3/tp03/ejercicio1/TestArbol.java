package tp03.ejercicio1;

public class TestArbol {

	public static void main(String[] args) {
		/* Arbol Binario
		 *      1
		 *   2     3
		 * 4   5
		 *
		 */
		ArbolBinario<Integer> arbol = new ArbolBinario<Integer>();
		arbol.setDato(1);
		arbol.agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		arbol.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(4));
		arbol.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(5));
		arbol.agregarHijoDerecho(new ArbolBinario<Integer>(3));
		System.out.println("Hojas = " + arbol.contarHojas());
		arbol.entreNiveles(0, 2);
		arbol.entreNiveles(1, 2);
		arbol.espejo().entreNiveles(0, 2);
	}

}

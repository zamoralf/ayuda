package arbolast;


import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CARLOS
 */
public class Nodo {

    public String valor;
    public List<Nodo> hijos;

    public Nodo(String valor) {
        this.valor = valor;
        hijos = new ArrayList<Nodo>();
    }
}

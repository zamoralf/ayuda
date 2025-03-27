/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package arbolast;
import java.util.HashMap;


/**
 *
 * @author CARLOS
 */
public class ListaVariables {
    public HashMap<String,Variable> var = new HashMap<String,Variable>();
    public ListaVariables(){}
    public Variable buscar(String nombre){
        return var.get(nombre);
    }

    public void agregar(Variable v){
        var.put(v.nombre, v);
    }
    
}

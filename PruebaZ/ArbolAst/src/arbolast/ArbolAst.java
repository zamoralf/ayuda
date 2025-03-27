/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package arbolast;

import java.util.List;

/**
 *
 * @author carlos
 */
public class ArbolAst {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Interfaz i = new Interfaz();
        i.setVisible(true);
    }

    public void ejecutarSwitch(Nodo switchNodo) {
        int valorSwitch = Integer.parseInt(switchNodo.hijos.get(0).valor); // Obtiene el valor de i
        List<Nodo> casos = switchNodo.hijos.get(1).hijos; // Lista de casos
        Nodo casoDefault = switchNodo.hijos.get(2); // Caso default

        boolean ejecutado = false;

        for (Nodo caso : casos) {
            int valorCaso = Integer.parseInt(caso.hijos.get(0).valor);
            if (valorCaso == valorSwitch) {
                ejecutarInstrucciones(caso.hijos.get(1)); // Ejecutar las instrucciones del caso
                ejecutado = true;
                break;
            }
        }

        if (!ejecutado && casoDefault.hijos.size() > 0) {
            ejecutarInstrucciones(casoDefault.hijos.get(0)); // Ejecutar el default si no hubo coincidencia
        }
    }

    private void ejecutarInstrucciones(Nodo instrucciones) {
        for (Nodo inst : instrucciones.hijos) {
            if (inst.valor.startsWith("puts")) {
                String mensaje = inst.valor.substring(5, inst.valor.length() - 1); // Extrae el mensaje de puts("...")
                System.out.println(mensaje);
            }
        }
    }


}

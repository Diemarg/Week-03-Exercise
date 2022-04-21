import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Printing {
    public static void main(String[] args) {
        //lee la primera linea y la almacena como el numero de casos
        Scanner in = new Scanner(System.in);
        int num = in.nextInt();
        in.nextLine();
        int x = 1;
        int unidadesMaximas = 1000000;
        //ciclo para que se repita el programa el # de casos solicitados
        while (num>0) {
            ArrayList<Integer> cyan = new ArrayList<>();
            ArrayList<Integer> magenta = new ArrayList<>();
            ArrayList<Integer> yellow = new ArrayList<>();
            ArrayList<Integer> black = new ArrayList<>();
            //se sepatan los inputs por espacios y se almacenan en su color correspondiente
            for(int i=0;i<3;i++){
                String line = in.nextLine();
                int[] numbers = Arrays.stream(line.split(" ")).mapToInt(Integer::parseInt).toArray();
                cyan.add(numbers[0]);
                magenta.add(numbers[1]);
                yellow.add(numbers[2]);
                black.add(numbers[3]);
            }
            //se busca el minimo de cada color
            int minCyan = Collections.min(cyan);
            int minMagenta = Collections.min(magenta);
            int minYellow = Collections.min(yellow);
            int minBlack = Collections.min(black);
            //se hace la suma de los minimos
            int sumMins = minCyan + minMagenta + minYellow + minBlack;
            //si la suma es igual a 10^6 se termina el programa y se imprimen los minimos
            if (sumMins == unidadesMaximas){
                System.out.println("Case #" + x + ": " + minCyan + " " +minMagenta + " " +minYellow + " " +minBlack);
            }
            //si la suma es menor a 10^6 es imposible
            else if (sumMins < unidadesMaximas){
                System.out.println("Case #" + x + ": IMPOSSIBLE");
            }
            //se hace un array con los minimps
            else {
                int[] minimos = {minCyan,minMagenta,minYellow,minBlack};
                for(int i=0;i<4;i++){
                    sumMins = 0;
                    //checa por columna si la suma de los colores que no se este considerando en el momento
                    for(int j=i+1;j<4;j++) {
                        sumMins+=minimos[j];
                    }
                    //si es mayor, el color actual es 0
                    if (sumMins >= unidadesMaximas) {
                        minimos[i] = 0;
                    }
                    //si no el color actual sera la resta de las unidadesMaximas y la suma de los minimos
                    else {
                        minimos[i]=unidadesMaximas-sumMins;
                        break;
                    }
                }
                System.out.println("Case #" + x + ": " + minimos[0] + " " +minimos[1] + " " +minimos[2] + " " +minimos[3]);
            }
            x++;
            num--;
        }
        in.close();
    }
}

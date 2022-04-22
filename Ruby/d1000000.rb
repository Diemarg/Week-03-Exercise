# Input, se pasa a arreglo por cada salto de linea
t = "4
4
6 10 12 8
6
5 4 5 4 4 4
10
10 10 7 6 7 4 4 5 7 4
1
10".split("\n");

# Asigno el arreglo a otra variable y lo convierto a integer, esto me regresa
# unicamente la primera columna del input
t2 = t.map(&:to_i)

#Contador de casos
cas = 1
# Contador auxiliar, aumenta de 2 en 2 para obtener el numero de dados
# por caso del arreglo t2
aux = 1

# Mientras caso sea menor o igual a 4
while cas <= t2[0]

    # Obtenemos el numero de dados del caso aux
    n = t2[aux]
    # Obtenemos los dados del caso, como arreglo entero y ordenado
    s = t[aux+1].split(" ").map(&:to_i).sort # 6 8 10 12 

    # Contador de resultados
    cur = 0;

    # Para l = 0 hasta n-1 (numero de dados del caso)
    for l in 0..(n-1) do
        # Si contador de casos es menor al dado de la pos l
        # y el dado es diferente al contador de casos se
        # suma uno al contador de resultados
        if cur <= s[l] && s[l] != cur
            cur += 1
        end
    end

    # Se imprimen los resultados por cada caso
    print "CASE #" + cas.to_s + ": " + cur.to_s
    puts ""

    # Aumentamos para el siguiente caso
    cas = cas + 1

    # Aumentamo
    aux = aux + 2
 end
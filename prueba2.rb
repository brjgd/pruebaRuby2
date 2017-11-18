#######
# Prueba Ruby
# Alvaro Torres Medina
#######
opcion = 0

while opcion != 4
    puts ''
    puts '************************************************'
    puts ''
    puts 'Ingrese una opción'
    puts '1: Nombre cada Almuno y Promedio Notas'
    puts '2: Cantidad de Inasistencias Totales'
    puts '3: Cantidad de Aprobados'
    puts '4: Salir'
    puts ''
    puts '************************************************'
    puts ''

    opcion = gets

    case opcion.to_i
    when 1
        
        file = File.open('alumnos.csv', 'r')
        data = file.readlines
        file.close

        arreglo_totales = []

        data.each do |line|
            total = 0
            arreglo = line.split(', ')
            total = (arreglo[1].to_f + arreglo[2].to_f + arreglo[3].to_f + arreglo[4].to_f + arreglo[5].to_f) / 5
            arreglo_totales.push([arreglo[0], total])
        end

        file = File.open('promedio.csv', 'w')
            arreglo_totales.each do |ele|
                file.puts "#{ele.first}, #{ele.last}"
            end
        file.close

        puts "Archivo promedio.csv generado!"

    when 2   
        data = []
        
        File.open('alumnos.csv', 'r') { |file| data = file.readlines}
            data.each do |ele|
            arreglo = ele.gsub("\n", "").split(', ')
            i = 0
            arreglo.each do |val|
                i =+1 if val == 'A'
            end
            puts "Inasistencias de almuno #{arreglo[0]} = #{i}"
          end
    when 3
        data = []
        File.open('promedio.csv', 'r') { |file| data = file.readlines}
          data.each do |ele|
            arreglo = ele.split(', ')
            puts "#{arreglo[0]} nota = #{arreglo[1].to_s}Estado: Aprobado!" if arreglo[1].to_f >= 5
        end
    when 4
        puts "Adios!"
        exit
    else
        puts "Ingresa un valor válido!"
    end

end
p '98. Дано цілочисловий масив. Вивести індекси елементів, які менші за свого лівого сусіда, та кількість таких чисел'
p '[15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]'
array = [15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]
a_res= []
a_res = (1...array.size).select { | i | array[i] < array[i-1] }
p a_res 
p a_res.size


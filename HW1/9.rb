p '9. Дано цілочисельний масив. Замінити всі додатні елементи на мінімальне значення'
p '[15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]'
array = [15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]
p array.map {|x| x>0 ? x=array.min : x}

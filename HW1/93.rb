p '93. Дано цілочисловий масив і число K. Якщо всі елементи масиву менші від K, вивести true; в іншому випадку вивести false'
p '[15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]'
p 'K == 17' 
array = [15, 87, 97, -94, 12, 14, 15, 18, 25, 38, -14, 17, 25, -24, 99, 24, 50]
k = 17
p  array.all? { | x | x < k }

p '3. Дано цілочисловий масив. Вивести номер першого з тих його елементів, які задовольняють подвійну нерівність: A[0] < A[i] < A[-1]. Якщо таких елементів немає, вивести [ ].'
p '[15, 87, 97, 94, 12, 14, 15, 18, 25, 38, 14, 17, 25, 24, 99, 24, 50]'
array = [15, 87, 97, 94, 12, 14, 15, 18, 25, 38, 14, 17, 25, 24, 99, 24, 50]
p array.index {|x| x>array[0] && x<array[-1]} || [ ]
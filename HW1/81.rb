p '81. Дано діапазон a..b. Отримати масив з чисел, розташованих у цьому діапазоні (виключаючи самі ці числа), у порядку їх зменшення, а також розмір цього масиву'
p '(15...38)'
a = 15
b = 38
p  (a+1...b).to_a.reverse!
p  (a+1...b).to_a.size

p '24. Дано дійсне число R і масив дійсних чисел. Знайти елемент масиву, який найменш близький до цього числа'
p 'R=51.3333333'
p '[-391.334, 106.734, -132.406, 419.246, -22.538, 106.064, -301.273, 20.306, 504.192, -231.992, -76.499, -15.125, -149.259, 269.296, 188.499, -571.249, 193.426]'
r = 51.3333333
array = [-391.334, 106.734, -132.406, 419.246, -22.538, 106.064, -301.273, 20.306, 504.192, -231.992, -76.499, -15.125, -149.259, 269.296, 188.499, -571.249, 193.426]
p array[array.map{ |x| (x-r).abs}.index(array.map{ |x| (x-r).abs}.max)]

p '82. Дано число А і натуральне число N. Знайти результат наступного виразу 1 + А + А*2 + А*3 + … + А*N'
p 'А == 17,3 N == 25'
a = 17.3
n = 25
p 1 + (1..n).to_a.sum * a 
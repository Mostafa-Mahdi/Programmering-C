divisble_numbers = []
for i in range(1,1000):
    if i % 3 == 0 or i % 5 == 0:
        divisble_numbers.append(i)

print(sum(divisble_numbers)) # 233168
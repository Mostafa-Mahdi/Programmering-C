# first two terms
previous_value, current_value = 0, 1
count = 0

fibo = []
sum_fibo = 0

# Get fibonacci sequence  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
while previous_value <= 4000000:  # Fibonacci sequence whose values do not exceed four million
    fibo.append(previous_value)
    nth = previous_value + current_value
    # update values
    previous_value = current_value
    current_value = nth
    count += 1


# find the sum of the even-valued terms.
sum = 0
for fibonacci in fibo:
    if fibonacci % 2 == 0:
        sum += fibonacci
print(sum) # 4613732
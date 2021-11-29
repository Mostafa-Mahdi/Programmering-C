from math import floor
# https://tacomacc.instructure.com/courses/1931063/pages/prime-number-test?module_item_id=41167387

def prime_factor(number: int):
    factors = []
    for i in range(3, int(floor(number ** 0.5)) ,2):
        if number % i == 0 and not prime_factor(i): # check om den kan divideres
            factors.append(i)
    return factors

print(prime_factor(600851475143 )[-1]) # 6857
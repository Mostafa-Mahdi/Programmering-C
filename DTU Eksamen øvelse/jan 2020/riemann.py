import numpy as np


def riemann(n, form):
    sum = 0
    if "a" in form:
        for i in range(1, n+1):
            sum += ((-1) ** (i + 1)) / np.ceil(i / 2)
    elif "b" in form:
        for i in range(1, n+1):
            sum += (-1 ** i + 1) / i
    return sum

print("Sa:", riemann(10000, "a")) # rigtige resultat
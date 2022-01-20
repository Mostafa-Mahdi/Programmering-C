import numpy as np

def imputed_sum(x):
    x = np.array(x, np.float64)
    for index, i in enumerate(x):
        neighbours = []
        if i == 999:
            try:
                if x[index-1] != 999:
                    neighbours.append(x[index-1])
                if x[index+1] != 999:
                    neighbours.append(x[index+1])
            except:
                pass
            middle_number = np.median(neighbours)
            x[index] = middle_number
    print(x)
    return np.sum(x)
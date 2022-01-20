import numpy as np


def packing(box, object):
    #box - object
    result = np.array([box[0] - object[0], box[1] - object[1]])
    result1 = np.array([object[0] - box[0], object[1] - box[1]])
    if(result.sum() < result1.sum()):
        return result
    else:
        return result1



print("d:", packing([2, 5], [4, 2.1]))
print("d:", packing([2.1, 4], [2, 5]))
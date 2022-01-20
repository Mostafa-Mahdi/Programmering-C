import numpy as np

def dice_sum_count(threshold, dice):
    count = 0
    if dice == 1:
        for first in range(1, 7):
            if first <= threshold:
                count += 1
    elif dice == 2:
        for first in range(1, 7):
            for second in range(1, 7):
                if (first + second) <= threshold:
                    count += 1
    elif dice == 3:
        for first in range(1, 7):
            for second in range(1, 7):
                for third in range(1, 7):
                    if (first + second + third) <= threshold:
                        count += 1
    return count
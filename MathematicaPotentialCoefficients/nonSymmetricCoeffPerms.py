import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from pandarallel import pandarallel
from itertools import product

n = 4
k = 3

# Generate all k-tuples of non-negative integers with sum ≤ n
combinations = [p for p in product(range(n + 1), repeat=k) if sum(p) <= n and sum(p) != 1]

# Define custom sort key:
# (1) Number of non-zero entries
# (2) Tuple values, to get lexicographical ordering
def sort_key(tup):
    num_filled = sum(1 for x in tup if x > 0)
    return (num_filled, tup)

# Sort the combinations
sorted_combinations = sorted(combinations, key=sort_key)

# Print result

for combo in sorted_combinations:
    print(combo)
    # powersList += list(combo)
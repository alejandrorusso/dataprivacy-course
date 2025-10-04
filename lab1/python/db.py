"""
Exercise: Reconstruction attack

We will use the file secret.csv (but you cannot inspect it so far)
"""

import csv
import random
from typing import List
from row_def import DB, Row, Name, HIV, Index, to_rows

# Noise magnitude
NOISE_PARAM = 10.0

def names(db: DB) -> List[Name]:
    """It provides the names of the dataset in the same order as they appear"""
    return [row.name for row in db.rows]

def add(db: DB, indices: List[Index]) -> float:
    """Adding elements at the position given by [Index] with noise (of magnitude NOISE_PARAM)"""
    s = sum(db.rows[i].hiv for i in indices)
    noise = from_uniform(-NOISE_PARAM, NOISE_PARAM)
    return s + noise

def from_uniform(li: float, ls: float) -> float:
    """Sample from a uniform distribution within the interval [li, ls]"""
    return random.uniform(li, ls)

def load_db() -> DB:
    """It loads the dataset from the file"""
    csv_data = import_csv("secret.csv")
    return DB(to_rows(csv_data))

def import_csv(path: str) -> List[List[str]]:
    """Auxiliary function for handling CSV files"""
    with open(path, 'r', newline='') as csvfile:
        reader = csv.reader(csvfile)
        rows = list(reader)
        # Remove header (first row) and last element since it's an empty list
        return rows[1:-1] if len(rows) > 1 and not rows[-1] else rows[1:]
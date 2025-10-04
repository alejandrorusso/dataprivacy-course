"""
Reconstruction attack implementation.
"""

from typing import List, Tuple
from itertools import combinations
from db import DB, load_db, names, add
from row_def import Name, HIV, Index

# A candidate is a guess on the hiv conditions of all the patients
Candidate = List[HIV]

# The result of our queries as float since we are releasing sums of hiv conditions with noise
ResultQuery = float

def show_names() -> List[Name]:
    """Loading and showing the names"""
    db = load_db()
    return names(db)

noise = 10

def comb(k: int, ns: List[int]) -> List[List[int]]:
    """Generates the combination of elements in ns taking by groups of size k"""
    return list(combinations(ns, k))

def indexes(size_db: int) -> List[List[Index]]:
    """Generates all possible combinations of indexes for a database of given size_db"""
    # TODO: Implement this function
    pass

def all_sums(db: DB) -> List[ResultQuery]:
    """Performs the noisy sums of all indexes combinations for a given database db. It calls add"""
    # TODO: Implement this function
    pass

def sum_indexes(candidate: Candidate, idx: List[Index]) -> ResultQuery:
    """Given a candidate and some indexes idx, it performs the sum of the conditions (no noise)"""
    # TODO: Implement this function
    pass

def all_sums_no_noise(candidate: Candidate) -> List[ResultQuery]:
    """Given a candidate, it performs the sums (without noise) of all indexes combinations"""
    # TODO: Implement this function
    pass

def generate_candidates(db: DB) -> List[Candidate]:
    """Given a database db, it generates all the possible candidates."""
    # TODO: Implement this function
    pass

def fit(noise_mag: float, results: List[ResultQuery], candidate: Candidate) -> bool:
    """
    This function will determine if exists a no-noisy sum on the candidate and a
    corresponding noisy sum in results which distance is greater than noise_mag.
    """
    # TODO: Implement this function
    pass

def find_candidate() -> List[Candidate]:
    """It finds candidates which no-noisy sums "fit" the noisy ones"""
    # TODO: Implement this function
    pass

def attack() -> List[Tuple[List[Name], Candidate]]:
    """This function guesses the conditions of the patients"""
    # TODO: Implement this function
    pass
"""
Exercise: Reconstruction attack

Data structures for database rows with patient names and HIV status.
"""

from typing import List
from dataclasses import dataclass

# Names are modeled as strings
Name = str
# HIV condition is modeled as a float for simplicity. Value 0 means the patient does not have HIV, and 1 otherwise.
HIV = float

@dataclass
class Row:
    """A Row is a register with two fields: the name of the patient and his/her hiv condition"""
    name: Name
    hiv: HIV

class DB:
    """A database is simply a list of rows of type Row"""
    def __init__(self, rows: List[Row]):
        self.rows = rows

# An Index is a row in the database
Index = int

def to_row(fields: List[str]) -> Row:
    """Convert list of strings to Row"""
    if len(fields) != 2:
        raise ValueError("Not correct format!")

    name = fields[0]
    hiv = float(fields[1])
    return Row(name=name, hiv=hiv)

def to_rows(csv_data: List[List[str]]) -> List[Row]:
    """Convert CSV data to list of Rows"""
    return [to_row(row) for row in csv_data]
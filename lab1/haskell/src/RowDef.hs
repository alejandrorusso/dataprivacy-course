{-
   Exercise: Reconstruction attack

   We will use the file secret.csv
-}
{-# LANGUAGE Trustworthy #-}
module RowDef
   ( -- Types
     Name
   , HIV
   , DB (DB)
   , Index
   , Row (Row)
     -- Selectors
   , name
   , hiv
     -- Constructor
   , toRows
   )
where

{-| Names are modeled strings -}
type Name = String
{-| HIV condition is modeled as a @Double@ for simplicity. Value @0@ means the patient does not have HIV, and @1@ otherwise. -}
type HIV  = Double

{-| A database is simply a list of rows of type @Row@ -}
data DB = DB [Row]

{-| An @Index@ is a row in the database -}
type Index = Int

{-| A @Row@ is a register with two fields: the @name@ of the patient and his/her @hiv@ condition -}
data Row = Row {
    name         :: Name
  , hiv          :: Double
}
  deriving Show

toRow :: [String] -> Row
toRow [n, h] =
  Row {
        name     = n
      , hiv      = read h
  }

toRow _ = error "Not correct format!"

toRows :: [[String]] -> [Row]
toRows csv = map toRow csv

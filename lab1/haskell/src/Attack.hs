{-# LANGUAGE Safe #-}
module Attack where

import DB
import Data.List
import Control.Monad

{-| A candidate is a guess on the @hiv@ conditions of all the patients -}
type Candidate   = [HIV]

{-| The result of our queries as @Double@ since we are releasing sums of @hiv@
  conditions with noise -}
type ResultQuery = Double

{-| Loading and showing the names -}
showNames :: IO [Name]
showNames = do
  db <- loadDB
  return $ names db

noise = 10

{-| Generates the combination of elements in @ns@ taking by groups of size @k@ -}
comb k ns = filter ((k==).length) $ subsequences ns

{-| Generates all possible combinations of indexes for a database of given @sizeDB@ -}
indexes :: Int -> [[Index]]
indexes sizeDB = undefined 

{-| Performs the noisy sums of all indexes combinations for a given database @db@. It calls @add@ -}
allSums :: DB -> IO [ResultQuery]
allSums db = undefined 

{-| Given a @candidate@ and some indexes @is@, it performs the sum of the conditions (no noise) -}
sumIndexes :: Candidate -> [Index] -> ResultQuery
sumIndexes candidate idx = undefined 

{-| Given a @candidate@, it performs the sums (without noise) of all indexes combinations -}
allSumsNoNoise :: Candidate -> [ResultQuery]
allSumsNoNoise candidate = undefined 

{-| Given a database @db@, it generates all the possible candidates. -}
generateCandidates :: DB -> [Candidate]
generateCandidates db = undefined 

{-| This function will determine if exists a no-noisy sum on the @candidate@ and a
  corresponding noisy sum in @results@ which distance is greater than
  @noisyMag@. -}
fit :: Double -> [ResultQuery] -> Candidate -> Bool
fit noiseMag results candidate = undefined 

{-| It finds candidates which no-noisy sums "fit" the noisy ones -}
findCandidate :: IO [Candidate]
findCandidate = undefined  

{-| This function guesses the conditions of the patients -}
attack :: IO [([Name], Candidate)]
attack = undefined 

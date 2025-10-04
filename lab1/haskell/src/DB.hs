{-
   Exercise: Reconstruction attack

   We will use the file secret.csv (but you cannot inspect it so far)
-}
{-# LANGUAGE Trustworthy #-}
module DB
   (
     DB ()
   , Name
   , HIV
   , Index
   , names
   , add
   , loadDB
   )
where

import RowDef
import Data.List.Split (splitOn)

-- Randomness
import Statistics.Distribution (genContVar)
import Statistics.Distribution.Uniform (uniformDistr)
import System.Random.MWC (createSystemRandom)

{-| Noise magnitud -}
noiseParam :: Double
noiseParam = 10

{-| It provides the names of the dataset in the same order as they appear -}
names :: DB -> [Name]
names (DB rs) = map name rs

{-| Adding elements at the position given by @[Index]@ with noise (of magnitud @noiseParam@) -}
add :: DB -> [Index] -> IO Double
add (DB rs) is = do
  let s = Prelude.sum [hiv (rs!!i) | i <- is]
  noise <- fromUniform (-noiseParam) noiseParam
  return (s + noise)

{-| Sample from an uniform distribution within the interval @[li,ls]@ -}
fromUniform :: Double -> Double -> IO Double
fromUniform li ls = do
  let uni = uniformDistr li ls
  gen <- createSystemRandom
  genContVar uni gen

{-| It loads the dataset from the file -}
loadDB :: IO DB
loadDB = do
  ds <- importCSV "secret.csv"
  return $ DB $ toRows ds

{-| Auxiliary function for handling CVS files -}
importCSV :: String -> IO [[String]]
importCSV path = do content <- readFile path
                    -- Removes header and last element since it's an empy list
                    let rows    = init $ tail $ splitOn "\n" content
                        columns = map (splitOn ",") rows
                    return columns

{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import GHC.Generics
import qualified Data.Vector.Storable.ByteString as BS
import qualified Data.Vector.Storable.ByteString.Char8 as C8
import qualified Data.Vector.Storable as V
import Foreign.Storable.Generic
import GHC.Word
import Data.Csv

data Person = Person { name :: BS.ByteString
                     , age :: Int
                     } deriving (Show, Read, Generic)

instance GStorable Person

main :: IO ()
main = do
  let person = Person "Cody" 25
  -- let people = V.fromList [person]
  -- writeVector "person.mmap" people
  print "ey"

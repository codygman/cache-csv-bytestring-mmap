{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import qualified Data.Vector.Storable.ByteString as BS
import qualified Data.Vector.Storable.ByteString.Char8 as C8
import qualified Data.Vector.Storable as V

import GHC.Generics
import Foreign.Storable
import Foreign.Storable.Generic

import GHC.Word
import Data.Csv
import Data.Packed.Vector.MMap

data Person = Person { name :: BS.ByteString
                     , age :: Int
                     } deriving (Show, Read, Generic)

main :: IO ()
main = do
  let person = Person "Cody" 25
  let people = V.fromList [person]
  -- writeVector "person.mmap" people
  print "ey"

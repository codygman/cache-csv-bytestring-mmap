{-# LANGUAGE DeriveGeneric #-}
module Main where

import Lib
import GHC.Generics
import qualified Data.Vector.Storable.ByteString as BS
import qualified Data.Vector.Storable as V
import Foreign.Storable.Generic
import GHC.Word
import Data.Csv

data Person = Person { name :: BS.ByteString
                     , age :: Int
                     } deriving (Show, Read, Generic)

instance GStorable Person
-- instance FromRecord Person
-- instance ToRecord Person


main :: IO ()
main = someFunc

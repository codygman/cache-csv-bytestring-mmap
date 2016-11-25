module Main where

import Lib
import qualified Data.Vector.Storable.ByteString as BS
import qualified Data.Vector.Storable as V
import GHC.Word
import Data.Csv
  
import Foreign.Storable.Record as Store
import Foreign.Storable (Storable (..), )

import Control.Applicative (liftA2, )

-- data Stereo a = Stereo {left, right :: a}

-- store :: Storable a => Store.Dictionary (Stereo a)
-- store =
--    Store.run $
--    liftA2 Stereo
--       (Store.element left)
--       (Store.element right)

-- instance (Storable a) => Storable (Stereo a) where
--    sizeOf = Store.sizeOf store
--    alignment = Store.alignment store
--    peek = Store.peek store
--    poke = Store.poke store

data Person a = Person { name :: BS.ByteString
                       , age :: Int
                       } deriving (Show, Read)

store :: Storable a => Store.Dictionary (Person a)
store =
   Store.run $
   liftA2 Person
      (Store.element name)
      (Store.element age)

instance (Storable a) => Storable (Person a) where
   sizeOf = Store.sizeOf store
   alignment = Store.alignment store
   peek = Store.peek store
   poke = Store.poke store



-- instance GStorable Person
-- instance FromRecord Person
-- instance ToRecord Person


main :: IO ()
main = someFunc

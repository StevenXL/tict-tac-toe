{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module ThreePeat (ThreePeat, createThreePeat, intercalateShow, all, countIf, sum) where

import ClassyPrelude hiding (toList, all, map, sum)
import qualified ClassyPrelude as CP

data ThreePeat a = ThreePeat { tpFirst :: a, tpSecond :: a, tpThird :: a } deriving Eq

instance Functor ThreePeat where
  fmap :: (a -> b) -> ThreePeat a -> ThreePeat b
  fmap f ThreePeat{..} = ThreePeat (f tpFirst) (f tpSecond) (f tpThird)

-- createThreePeat = ThreePeat
-- The above is bad because it would expose the data constructor
createThreePeat :: a -> a -> a -> ThreePeat a
createThreePeat f s t = ThreePeat f s t

toList :: ThreePeat a -> [a]
toList ThreePeat{..} = [tpFirst, tpSecond, tpThird]

intercalateShow :: Text -> (a -> Text) -> ThreePeat a -> Text
intercalateShow b f = intercalate b . fmap f . toList

all :: (a -> Bool) -> ThreePeat a -> Bool
all p = and . fmap p . toList

countIf :: Eq a => a -> ThreePeat a -> Int
countIf a = length . filter (== a) . toList

sum :: Num a => ThreePeat a -> a
sum = CP.sum . toList

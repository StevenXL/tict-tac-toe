{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module ThreePeat (ThreePeat, createThreePeat, intercalateShow, all, countIf, sum, get, insert) where

import ClassyPrelude hiding (toList, all, map, sum, Index, foldr, length)
import qualified ClassyPrelude as CP
import Index
import Data.Foldable (Foldable(..))

data ThreePeat a = ThreePeat { tpFirst :: a, tpSecond :: a, tpThird :: a } deriving Eq

instance Functor ThreePeat where
  fmap :: (a -> b) -> ThreePeat a -> ThreePeat b
  fmap f ThreePeat{..} = ThreePeat (f tpFirst) (f tpSecond) (f tpThird)

instance Foldable ThreePeat where
  foldr :: (a -> b -> b) -> b -> ThreePeat a -> b
  foldr f b ThreePeat{..} = foldr f b [tpFirst, tpSecond, tpThird]

createThreePeat :: a -> a -> a -> ThreePeat a
createThreePeat f s t = ThreePeat f s t -- do not expose ThreePeat data constructor

intercalateShow :: Text -> (a -> Text) -> ThreePeat a -> Text
intercalateShow b f = intercalate b . fmap f . toList

all :: (a -> Bool) -> ThreePeat a -> Bool
all p = and . fmap p . toList

countIf :: Eq a => a -> ThreePeat a -> Int
countIf a = length . filter (== a) . toList

get :: Index -> ThreePeat a -> a
get idx = getter idx

insert :: Index -> ThreePeat a -> a -> ThreePeat a
insert Zero threePeat a = threePeat { tpFirst = a }
insert One threePeat  a = threePeat { tpSecond = a }
insert Two threePeat  a = threePeat { tpThird = a }

getter :: Index -> (ThreePeat a -> a)
getter Zero = tpFirst
getter One = tpSecond
getter Two = tpThird

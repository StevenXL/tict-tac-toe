{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module ThreePeat (ThreePeat, createThreePeat, toList, intercalateShow) where

import ClassyPrelude hiding (toList)

data ThreePeat a = ThreePeat { tpFirst :: a, tpSecond :: a, tpThird :: a }

-- do not do createThreePeat = ThreePeat, because that exposes the data
-- constructor
createThreePeat :: a -> a -> a -> ThreePeat a
createThreePeat f s t = ThreePeat f s t

toList :: ThreePeat a -> [a]
toList ThreePeat{..} = [tpFirst, tpSecond, tpThird]

intercalateShow :: Text -> (a -> Text) -> ThreePeat a -> Text
intercalateShow b f = intercalate b . fmap f . toList

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Row (Row, showRow, newRow, count) where

import ClassyPrelude hiding (toList)
import Square
import ThreePeat
import Piece

newtype Row = Row { unRow :: ThreePeat Square } deriving Eq

showRow :: Row -> Text
showRow row = intercalateShow "|" showSquare (unRow row)

newRow :: Row
newRow = Row $ createThreePeat newSquare newSquare newSquare

count :: Piece -> Row -> Int
count piece row = countIf True $ fmap (is piece) (unRow row)

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Row (Row, showRow, newRow, count, playRow) where

import ClassyPrelude hiding (toList, Index, empty)
import Square
import ThreePeat
import Piece
import Index

newtype Row = Row { unRow :: ThreePeat Square } deriving Eq

showRow :: Row -> Text
showRow row = intercalateShow "|" showSquare (unRow row)

newRow :: Row
newRow = Row $ createThreePeat newSquare newSquare newSquare

count :: Piece -> Row -> Int
count piece row = countIf True $ fmap (is piece) (unRow row)

playRow :: Index -> Piece -> Row -> Row
playRow idx piece row = if empty currentSquare
                          then row { unRow = newRow}
                          else row
  where currentSquare = get idx (unRow row)
        newRow = insert idx (unRow row) (updateSquare piece currentSquare)

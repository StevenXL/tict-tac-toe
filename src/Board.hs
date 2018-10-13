{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Board (Board, showBoard, newBoard, getCurrentPlayer) where

import ClassyPrelude hiding (empty, all, sum)
import Row hiding (empty, count)
import qualified Row as R
import ThreePeat
import Piece

newtype Board = Board { unBoard :: ThreePeat Row }

showBoard :: Board -> Text
showBoard board = intercalateShow "\n" showRow (unBoard board)

newBoard :: Board
newBoard = Board $ createThreePeat newRow newRow newRow

count :: Piece -> Board -> Int
count piece board = sum $ fmap (R.count piece) (unBoard board)

empty :: Board -> Bool
empty board = all (== newRow) (unBoard board)

getCurrentPlayer :: Board -> Piece
getCurrentPlayer board
  | empty board || xCount == oCount = X
  | otherwise = O
  where xCount = count X board
        oCount = count O board

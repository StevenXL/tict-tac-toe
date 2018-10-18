{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Board (Board, newBoard, getCurrentPlayer, playBoard) where

import ClassyPrelude hiding (empty, all, sum)
import Row hiding (empty, count)
import qualified Row as R
import ThreePeat
import Piece
import Position

newtype Board = Board { unBoard :: ThreePeat Row }

instance Show Board where
  show :: Board -> String
  show = unpack . intercalateShow "\n" showRow . unBoard

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

playBoard :: Position -> Board -> Board
playBoard position board = board { unBoard = playedBoard }
  where playedBoard = insert (positionRow position) (unBoard board) playedRow
        playedRow   = playRow (positionCol position) piece currentRow
        piece       = getCurrentPlayer board
        currentRow  = get (positionRow position) (unBoard board)

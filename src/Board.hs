{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Board (Board, showBoard, newBoard) where

import ClassyPrelude hiding (toList)
import Row
import ThreePeat

newtype Board = Board { unBoard :: ThreePeat Row }

showBoard :: Board -> Text
showBoard board = intercalateShow "\n" showRow (unBoard board)

newBoard :: Board
newBoard = Board $ createThreePeat newRow newRow newRow

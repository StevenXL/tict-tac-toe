{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Board (Board, showBoard, newBoard) where

import ClassyPrelude
import Row

data Board = Board { firstRow :: Row, secondRow :: Row, thirdRow :: Row }

showBoard :: Board -> Text
showBoard (Board fRow sRow tRow) = intercalate "\n" [showRow fRow, showRow sRow, showRow tRow]

newBoard :: Board
newBoard = Board newRow newRow newRow

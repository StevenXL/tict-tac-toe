{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude
import Square

data Row = Row { firstSquare :: Square, secondSquare :: Square, thirdSquare :: Square }

data Board = Board { firstRow :: Row, secondRow :: Row, thirdRow :: Row }

data Game = Game { board :: Board }

printGame :: Game -> IO ()
printGame (Game board) = putStr $ showBoard board

showBoard :: Board -> Text
showBoard (Board fRow sRow tRow) = intercalate "\n" [showRow fRow, showRow sRow, showRow tRow]

showRow :: Row -> Text
showRow (Row fSquare sSquare tSquare) = intercalate "|" [showSquare fSquare, showSquare sSquare, showSquare tSquare]

test :: IO ()
test = printGame game
  where game = Game board
        board = Board fRow fRow fRow
        fRow = Row fS fS fS
        fS = newEmptySquare

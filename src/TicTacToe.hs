{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude
import Square

data Row = Row { firstSquare :: Square, secondSquare :: Square, thirdSquare :: Square }

data Board = Board { firstRow :: Row, secondRow :: Row, thirdRow :: Row }

data Game = Game { board :: Board }

printGame :: Game -> IO ()
printGame (Game board) = print $ showBoard board

showBoard :: Board -> String
showBoard (Board fRow sRow tRow) = intercalate "\n" [showRow fRow, showRow sRow, showRow tRow]

showRow :: Row -> String
showRow (Row fSquare sSquare tSquare) = intercalate "|" [showSquare fSquare, showSquare sSquare, showSquare tSquare]

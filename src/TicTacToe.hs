{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude
import Square

data Row = Row { firstSquare :: Square, secondSquare :: Square, thirdSquare :: Square }

data Board = Board { firstRow :: Row, secondRow :: Row, thirdRow :: Row }

data Game = Game { board :: Board }

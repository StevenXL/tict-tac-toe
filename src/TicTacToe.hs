{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude

data Piece = X | O

data Square = Empty | NonEmpty Piece

data Row = Row { firstSquare :: Square, secondSquare :: Square, thirdSquare :: Square }

data Board = Board { firstRow :: Row, secondRow :: Row, thirdRow :: Row }

data Game = Game { board :: Board }

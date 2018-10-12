{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude
import Game
import Board
import Row
import Square

test :: IO ()
test = printGame game
  where game = Game board
        board = Board fRow fRow fRow
        fRow = Row fS fS fS
        fS = newEmptySquare

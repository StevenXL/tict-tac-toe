{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module TicTacToe where

import ClassyPrelude
import Game (newGame, printGame)

test :: IO ()
test = printGame newGame

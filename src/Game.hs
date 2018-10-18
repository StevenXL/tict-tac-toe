{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Game (newGame, playGame) where

import ClassyPrelude
import Board
import Position

data Game = Game { gameBoard :: Board }

instance Show Game where
  show :: Game -> String
  show = show . gameBoard

newGame :: Game
newGame = Game newBoard

playGame :: Position -> Game -> Game
playGame position game = game { gameBoard = playedBoard }
  where playedBoard = playBoard position (gameBoard game)

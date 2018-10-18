{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Game (printGame, newGame, playGame) where

import ClassyPrelude
import Board
import Position

data Game = Game { gameBoard :: Board }

printGame :: Game -> IO ()
printGame game = putStrLn $ showBoard (gameBoard game)

newGame :: Game
newGame = Game newBoard

playGame :: Position -> Game -> Game
playGame position game = game { gameBoard = playedBoard }
  where playedBoard = playBoard position (gameBoard game)

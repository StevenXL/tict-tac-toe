{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Game (printGame, newGame) where

import ClassyPrelude
import Board

data Game = Game { board :: Board }

printGame :: Game -> IO ()
printGame (Game board) = putStrLn $ showBoard board

newGame :: Game
newGame = Game newBoard

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Game (printGame, newGame) where

import ClassyPrelude
import Board
import Position

data Game = Game { board :: Board }

printGame :: Game -> IO ()
printGame game = putStrLn $ showBoard (board game)

newGame :: Game
newGame = Game newBoard

play :: Position -> Game -> Game
play position game = let piece = getCurrentPlayer (board game)
                     in error "not implemented"

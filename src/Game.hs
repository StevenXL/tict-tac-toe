{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Game where

import ClassyPrelude
import Board

data Game = Game { board :: Board }

printGame :: Game -> IO ()
printGame (Game board) = putStrLn $ showBoard board

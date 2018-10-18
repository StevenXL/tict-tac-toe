{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Square (Square, showSquare, newSquare, is, empty, updateSquare) where

import ClassyPrelude hiding (empty)
import Piece

newtype Square = Square { unSquare :: Maybe Piece } deriving Eq

showSquare :: Square -> Text
showSquare square = maybe "-" showPiece (unSquare square)

newSquare :: Square
newSquare = Square Nothing

is :: Piece -> Square -> Bool
is piece square = maybe False (== piece) (unSquare square)

empty :: Square -> Bool
empty = (== newSquare)

updateSquare :: Piece -> Square -> Square
updateSquare piece square
  | empty square = Square $ Just piece
  | otherwise = square

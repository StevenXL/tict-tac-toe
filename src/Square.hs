{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Square (Square, showSquare, newSquare, is) where

import ClassyPrelude
import Piece

newtype Square = Square { unSquare :: Maybe Piece } deriving Eq

showSquare :: Square -> Text
showSquare square = maybe "-" showPiece (unSquare square)

newSquare :: Square
newSquare = Square Nothing

is :: Piece -> Square -> Bool
is piece square = maybe False (== piece) (unSquare square)

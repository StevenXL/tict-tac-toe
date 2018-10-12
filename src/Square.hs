{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Square (Square, showSquare, newSquare) where

import ClassyPrelude
import Piece

newtype Square = Square { unSquare :: Maybe Piece }

showSquare :: Square -> Text
showSquare square = maybe "-" showPiece (unSquare square)

newSquare :: Square
newSquare = Square Nothing

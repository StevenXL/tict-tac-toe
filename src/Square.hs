{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Square (Square, showSquare, newFilledSquare, newEmptySquare) where

import ClassyPrelude
import Piece

newtype Square = Square { unSquare :: Maybe Piece }

showSquare :: Square -> Text
showSquare square = maybe "-" showPiece (unSquare square)

newFilledSquare :: Piece -> Square
newFilledSquare piece = Square $ Just piece

newEmptySquare :: Square
newEmptySquare = Square Nothing

module Square (Square, showSquare, newFilledSquare, newEmptySquare) where

import Piece

newtype Square = Square { unSquare :: Maybe Piece }

showSquare :: Square -> String
showSquare square = maybe "-" show (unSquare square)

newFilledSquare :: Piece -> Square
newFilledSquare piece = Square $ Just piece

newEmptySquare :: Square
newEmptySquare = Square Nothing

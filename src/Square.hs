module Square (Square, showSquare) where

import Piece

newtype Square = Square { unSquare :: Maybe Piece }

showSquare :: Square -> String
showSquare square = maybe "-" show (unSquare square)

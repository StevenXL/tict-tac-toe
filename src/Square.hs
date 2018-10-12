module Square (Square) where

import Piece

newtype Square = Square { unSquare :: Maybe Piece }

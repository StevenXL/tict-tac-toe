{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Piece where

import ClassyPrelude

data Piece = X | O

showPiece :: Piece -> Text
showPiece X = "X"
showPiece O = "O"

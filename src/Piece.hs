{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Piece where

import ClassyPrelude

data Piece = X | O deriving Eq

showPiece :: Piece -> Text
showPiece X = "X"
showPiece O = "O"

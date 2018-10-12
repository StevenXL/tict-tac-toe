{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Row (Row, showRow, newRow) where

import ClassyPrelude hiding (toList)
import Square
import ThreePeat

newtype Row = Row { unRow :: ThreePeat Square }

showRow :: Row -> Text
showRow row = intercalateShow "|" showSquare (unRow row)

newRow :: Row
newRow = Row $ createThreePeat newSquare newSquare newSquare

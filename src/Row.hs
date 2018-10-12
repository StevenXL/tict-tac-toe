{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Row (Row(..), showRow) where

import ClassyPrelude
import Square

data Row = Row { firstSquare :: Square, secondSquare :: Square, thirdSquare :: Square }

showRow :: Row -> Text
showRow (Row fSquare sSquare tSquare) = intercalate "|" [showSquare fSquare, showSquare sSquare, showSquare tSquare]


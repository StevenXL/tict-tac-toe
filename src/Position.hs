{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Position (Position(..)) where

import Index

data Position = Position { positionRow :: Index, positionCol :: Index }

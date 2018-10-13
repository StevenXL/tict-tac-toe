{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Position where

import Index

newtype Position = Position (Index, Index)

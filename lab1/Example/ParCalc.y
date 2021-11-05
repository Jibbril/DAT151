-- -*- haskell -*- File generated by the BNF Converter (bnfc 2.9.3).

-- Parser definition for use with Happy
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module ParCalc
  ( happyError
  , myLexer
  , pExp
  , pExp1
  , pExp2
  ) where

import Prelude

import qualified AbsCalc
import LexCalc

}

%name pExp Exp
%name pExp1 Exp1
%name pExp2 Exp2
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '('      { PT _ (TS _ 1) }
  ')'      { PT _ (TS _ 2) }
  '*'      { PT _ (TS _ 3) }
  '+'      { PT _ (TS _ 4) }
  '-'      { PT _ (TS _ 5) }
  '/'      { PT _ (TS _ 6) }
  'iadd'   { PT _ (TS _ 7) }
  L_integ  { PT _ (TI $$)  }

%%

Integer :: { Integer }
Integer  : L_integ  { (read $1) :: Integer }

Exp :: { AbsCalc.Exp }
Exp
  : Exp '+' Exp1 { AbsCalc.EAdd $1 $3 }
  | Exp '-' Exp1 { AbsCalc.EMin $1 $3 }
  | Exp Exp 'iadd' { AbsCalc.JVMAdd $1 $2 }
  | Exp Exp { AbsCalc.EDefault $1 $2 }
  | Exp1 { $1 }

Exp1 :: { AbsCalc.Exp }
Exp1
  : Exp1 '*' Exp2 { AbsCalc.EMul $1 $3 }
  | Exp1 '/' Exp2 { AbsCalc.EDiv $1 $3 }
  | Exp2 { $1 }

Exp2 :: { AbsCalc.Exp }
Exp2 : Integer { AbsCalc.EInt $1 } | '(' Exp ')' { $2 }

{

type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens

}


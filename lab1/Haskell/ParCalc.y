-- -*- haskell -*- File generated by the BNF Converter (bnfc 2.9.3).

-- Parser definition for use with Happy
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module ParCalc
  ( happyError
  , myLexer
  , pProgram
  , pListDef
  , pDef
  , pListArg
  , pListStm
  , pArg
  , pStm
  , pExp
  , pType
  , pExp1
  ) where

import Prelude

import qualified AbsCalc
import LexCalc

}

%name pProgram Program
%name pListDef ListDef
%name pDef Def
%name pListArg ListArg
%name pListStm ListStm
%name pArg Arg
%name pStm Stm
%name pExp Exp
%name pType Type
%name pExp1 Exp1
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '('         { PT _ (TS _ 1)  }
  ')'         { PT _ (TS _ 2)  }
  ','         { PT _ (TS _ 3)  }
  ';'         { PT _ (TS _ 4)  }
  '<<'        { PT _ (TS _ 5)  }
  'bool'      { PT _ (TS _ 6)  }
  'double'    { PT _ (TS _ 7)  }
  'int'       { PT _ (TS _ 8)  }
  'return'    { PT _ (TS _ 9)  }
  'std::cout' { PT _ (TS _ 10) }
  'std::endl' { PT _ (TS _ 11) }
  'void'      { PT _ (TS _ 12) }
  '{'         { PT _ (TS _ 13) }
  '}'         { PT _ (TS _ 14) }
  L_doubl     { PT _ (TD $$)   }
  L_integ     { PT _ (TI $$)   }
  L_quoted    { PT _ (TL $$)   }
  L_Id        { PT _ (T_Id $$) }

%%

Double  :: { Double }
Double   : L_doubl  { (read $1) :: Double }

Integer :: { Integer }
Integer  : L_integ  { (read $1) :: Integer }

String  :: { String }
String   : L_quoted { $1 }

Id :: { AbsCalc.Id }
Id  : L_Id { AbsCalc.Id $1 }

Program :: { AbsCalc.Program }
Program : ListDef { AbsCalc.PDefs $1 }

ListDef :: { [AbsCalc.Def] }
ListDef : {- empty -} { [] } | Def ListDef { (:) $1 $2 }

Def :: { AbsCalc.Def }
Def
  : Type Id '(' ListArg ')' '{' ListStm '}' { AbsCalc.DFun $1 $2 $4 $7 }

ListArg :: { [AbsCalc.Arg] }
ListArg
  : {- empty -} { [] }
  | Arg { (:[]) $1 }
  | Arg ',' ListArg { (:) $1 $3 }

ListStm :: { [AbsCalc.Stm] }
ListStm : {- empty -} { [] } | Stm ListStm { (:) $1 $2 }

Arg :: { AbsCalc.Arg }
Arg : Type Id { AbsCalc.ADecl $1 $2 }

Stm :: { AbsCalc.Stm }
Stm
  : 'std::cout' '<<' Exp '<<' 'std::endl' ';' { AbsCalc.SCout $3 }
  | 'return' Exp ';' { AbsCalc.SReturn $2 }

Exp :: { AbsCalc.Exp }
Exp
  : Integer { AbsCalc.EInt $1 }
  | Double { AbsCalc.EDouble $1 }
  | String { AbsCalc.EString $1 }
  | Exp1 { $1 }

Type :: { AbsCalc.Type }
Type
  : 'bool' { AbsCalc.Tbool }
  | 'double' { AbsCalc.Tdouble }
  | 'int' { AbsCalc.Tint }
  | 'void' { AbsCalc.Tvoid }

Exp1 :: { AbsCalc.Exp }
Exp1 : '(' Exp ')' { $2 }

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


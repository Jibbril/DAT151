-- File generated by the BNF Converter (bnfc 2.9.3).

{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif

-- | Pretty-printer for Calc.

module Calc.Print where

import Prelude
  ( ($), (.)
  , Bool(..), (==), (<)
  , Int, Integer, Double, (+), (-), (*)
  , String, (++)
  , ShowS, showChar, showString
  , all, elem, foldr, id, map, null, replicate, shows, span
  )
import Data.Char ( Char, isSpace )
import qualified Calc.Abs

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 False (map ($ "") $ d []) ""
  where
  rend
    :: Int        -- ^ Indentation level.
    -> Bool       -- ^ Pending indentation to be output before next character?
    -> [String]
    -> ShowS
  rend i p = \case
      "["      :ts -> char '[' . rend i False ts
      "("      :ts -> char '(' . rend i False ts
      "{"      :ts -> onNewLine i     p . showChar   '{'  . new (i+1) ts
      "}" : ";":ts -> onNewLine (i-1) p . showString "};" . new (i-1) ts
      "}"      :ts -> onNewLine (i-1) p . showChar   '}'  . new (i-1) ts
      [";"]        -> char ';'
      ";"      :ts -> char ';' . new i ts
      t  : ts@(s:_) | closingOrPunctuation s
                   -> pending . showString t . rend i False ts
      t        :ts -> pending . space t      . rend i False ts
      []           -> id
    where
    -- Output character after pending indentation.
    char :: Char -> ShowS
    char c = pending . showChar c

    -- Output pending indentation.
    pending :: ShowS
    pending = if p then indent i else id

  -- Indentation (spaces) for given indentation level.
  indent :: Int -> ShowS
  indent i = replicateS (2*i) (showChar ' ')

  -- Continue rendering in new line with new indentation.
  new :: Int -> [String] -> ShowS
  new j ts = showChar '\n' . rend j True ts

  -- Make sure we are on a fresh line.
  onNewLine :: Int -> Bool -> ShowS
  onNewLine i p = (if p then id else showChar '\n') . indent i

  -- Separate given string from following text by a space (if needed).
  space :: String -> ShowS
  space t s =
    case (all isSpace t', null spc, null rest) of
      (True , _   , True ) -> []              -- remove trailing space
      (False, _   , True ) -> t'              -- remove trailing space
      (False, True, False) -> t' ++ ' ' : s   -- add space if none
      _                    -> t' ++ s
    where
      t'          = showString t []
      (spc, rest) = span isSpace s

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt i = concatD . map (prt i)

instance Print Char where
  prt _ c = doc (showChar '\'' . mkEsc '\'' c . showChar '\'')

instance Print String where
  prt _ = printString

printString :: String -> Doc
printString s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q = \case
  s | s == q -> showChar '\\' . showChar s
  '\\' -> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  s -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Calc.Abs.Id where
  prt _ (Calc.Abs.Id i) = doc $ showString i
instance Print Calc.Abs.Program where
  prt i = \case
    Calc.Abs.ProgDef defs -> prPrec i 0 (concatD [prt 0 defs])

instance Print Calc.Abs.Def where
  prt i = \case
    Calc.Abs.QualConstDef qualconst -> prPrec i 0 (concatD [doc (showString "using"), prt 0 qualconst, doc (showString ";")])
    Calc.Abs.StmDef gentype inits -> prPrec i 0 (concatD [prt 0 gentype, prt 0 inits, doc (showString ";")])
    Calc.Abs.FuncDef gentype id_ args stms -> prPrec i 0 (concatD [prt 0 gentype, prt 0 id_, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString "{"), prt 0 stms, doc (showString "}")])
    Calc.Abs.FuncDef2 gentype id_ args -> prPrec i 0 (concatD [prt 0 gentype, prt 0 id_, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString ";")])
    Calc.Abs.TypeDef gentype id_ -> prPrec i 0 (concatD [doc (showString "typedef"), prt 0 gentype, prt 0 id_, doc (showString ";")])

instance Print [Calc.Abs.Def] where
  prt _ [] = concatD []
  prt _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print [Calc.Abs.Arg] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print Calc.Abs.Arg where
  prt i = \case
    Calc.Abs.ArgDecl2 gentype init -> prPrec i 0 (concatD [prt 0 gentype, prt 0 init])
    Calc.Abs.ArgDecl3 gentype -> prPrec i 0 (concatD [prt 0 gentype])

instance Print Calc.Abs.Stm where
  prt i = \case
    Calc.Abs.InitStm gentype inits -> prPrec i 0 (concatD [prt 0 gentype, prt 0 inits, doc (showString ";")])
    Calc.Abs.StmExp exp -> prPrec i 0 (concatD [prt 0 exp, doc (showString ";")])
    Calc.Abs.ReturnStm stm -> prPrec i 0 (concatD [doc (showString "return"), prt 0 stm])
    Calc.Abs.WhileStm exp stm -> prPrec i 0 (concatD [doc (showString "while"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm])
    Calc.Abs.IfStm exp stm -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm])
    Calc.Abs.IfElseStm exp stm1 stm2 -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm1, doc (showString "else"), prt 0 stm2])
    Calc.Abs.ForStm gentype init exp1 exp2 stm -> prPrec i 0 (concatD [doc (showString "for"), doc (showString "("), prt 0 gentype, prt 0 init, doc (showString ";"), prt 0 exp1, doc (showString ";"), prt 0 exp2, doc (showString ")"), prt 0 stm])
    Calc.Abs.DoWhileStm stm exp -> prPrec i 0 (concatD [doc (showString "do"), prt 0 stm, doc (showString "while"), doc (showString "("), prt 0 exp, doc (showString ")"), doc (showString ";")])
    Calc.Abs.BlockStm stms -> prPrec i 0 (concatD [doc (showString "{"), prt 0 stms, doc (showString "}")])
    Calc.Abs.TypeDefStm gentype id_ -> prPrec i 0 (concatD [doc (showString "typedef"), prt 0 gentype, prt 0 id_, doc (showString ";")])

instance Print [Calc.Abs.Stm] where
  prt _ [] = concatD []
  prt _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print Calc.Abs.Exp where
  prt i = \case
    Calc.Abs.ThrowExcep exp -> prPrec i 1 (concatD [doc (showString "throw"), prt 1 exp])
    Calc.Abs.AssignExp exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "="), prt 2 exp2])
    Calc.Abs.PlusAssigExp exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "+="), prt 2 exp2])
    Calc.Abs.MinusAssigExp exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "-="), prt 2 exp2])
    Calc.Abs.CondExp exp1 exp2 exp3 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "?"), prt 0 exp2, doc (showString ":"), prt 2 exp3])
    Calc.Abs.DisjExp exp1 exp2 -> prPrec i 3 (concatD [prt 3 exp1, doc (showString "||"), prt 4 exp2])
    Calc.Abs.ConjExp exp1 exp2 -> prPrec i 4 (concatD [prt 4 exp1, doc (showString "&&"), prt 5 exp2])
    Calc.Abs.EqExp exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "=="), prt 9 exp2])
    Calc.Abs.InEqExp exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "!="), prt 9 exp2])
    Calc.Abs.LessExp exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<"), prt 10 exp2])
    Calc.Abs.LeqExp exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<="), prt 10 exp2])
    Calc.Abs.GeqExp exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">="), prt 10 exp2])
    Calc.Abs.GreaterExp exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">"), prt 10 exp2])
    Calc.Abs.LShift exp1 exp2 -> prPrec i 10 (concatD [prt 10 exp1, doc (showString "<<"), prt 11 exp2])
    Calc.Abs.RShift exp1 exp2 -> prPrec i 10 (concatD [prt 10 exp1, doc (showString ">>"), prt 11 exp2])
    Calc.Abs.AddExp exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "+"), prt 12 exp2])
    Calc.Abs.MinExp exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "-"), prt 12 exp2])
    Calc.Abs.MulExp exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "*"), prt 13 exp2])
    Calc.Abs.DivExp exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "/"), prt 13 exp2])
    Calc.Abs.ModExp exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "%"), prt 13 exp2])
    Calc.Abs.Incr2Exp exp -> prPrec i 13 (concatD [doc (showString "++"), prt 13 exp])
    Calc.Abs.Decr2Exp exp -> prPrec i 13 (concatD [doc (showString "--"), prt 13 exp])
    Calc.Abs.NegExp exp -> prPrec i 13 (concatD [doc (showString "!"), prt 13 exp])
    Calc.Abs.DeRefExp exp -> prPrec i 13 (concatD [doc (showString "*"), prt 13 exp])
    Calc.Abs.Incr1Exp exp -> prPrec i 14 (concatD [prt 14 exp, doc (showString "++")])
    Calc.Abs.Decr1Exp exp -> prPrec i 14 (concatD [prt 14 exp, doc (showString "--")])
    Calc.Abs.IndexExp exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "["), prt 0 exp2, doc (showString "]")])
    Calc.Abs.FunCallExp exp exps -> prPrec i 14 (concatD [prt 14 exp, doc (showString "("), prt 0 exps, doc (showString ")")])
    Calc.Abs.DotStrucProjExp exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "."), prt 15 exp2])
    Calc.Abs.ArrStrucProjExp exp1 exp2 -> prPrec i 14 (concatD [prt 14 exp1, doc (showString "->"), prt 15 exp2])
    Calc.Abs.IntExp n -> prPrec i 15 (concatD [prt 0 n])
    Calc.Abs.DoubleExp d -> prPrec i 15 (concatD [prt 0 d])
    Calc.Abs.StringArrExp strs -> prPrec i 15 (concatD [prt 0 strs])
    Calc.Abs.CharExp c -> prPrec i 15 (concatD [prt 0 c])
    Calc.Abs.QualConstExp qualconst -> prPrec i 15 (concatD [prt 0 qualconst])

instance Print [Calc.Abs.Exp] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [String] where
  prt _ [] = concatD []
  prt _ [x] = concatD [printString x]
  prt _ (x:xs) = concatD [printString x, prt 0 xs]

instance Print Calc.Abs.QualConst where
  prt i = \case
    Calc.Abs.QualConstDecls ids -> prPrec i 0 (concatD [prt 0 ids])

instance Print [Calc.Abs.Id] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString "::"), prt 0 xs]

instance Print Calc.Abs.Type where
  prt i = \case
    Calc.Abs.CharType -> prPrec i 0 (concatD [doc (showString "char")])
    Calc.Abs.BoolType -> prPrec i 0 (concatD [doc (showString "bool")])
    Calc.Abs.DoubleType -> prPrec i 0 (concatD [doc (showString "double")])
    Calc.Abs.IntType -> prPrec i 0 (concatD [doc (showString "int")])
    Calc.Abs.VoidType -> prPrec i 0 (concatD [doc (showString "void")])
    Calc.Abs.QualConstType qualconst -> prPrec i 0 (concatD [prt 0 qualconst])

instance Print Calc.Abs.GenType where
  prt i = \case
    Calc.Abs.GenTypeDecl type_ -> prPrec i 0 (concatD [prt 0 type_])
    Calc.Abs.ConstGenType type_ -> prPrec i 0 (concatD [doc (showString "const"), prt 0 type_])
    Calc.Abs.AndGenType type_ -> prPrec i 0 (concatD [prt 0 type_, doc (showString "&")])
    Calc.Abs.CAndGenType type_ -> prPrec i 0 (concatD [doc (showString "const"), prt 0 type_, doc (showString "&")])

instance Print Calc.Abs.Init where
  prt i = \case
    Calc.Abs.InitDecl id_ -> prPrec i 0 (concatD [prt 0 id_])
    Calc.Abs.InitAssign id_ exp -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), prt 0 exp])

instance Print [Calc.Abs.Init] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

-- File generated by the BNF Converter (bnfc 2.9.3).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Calc.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Calc.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transId :: Calc.Abs.Id -> Result
transId x = case x of
  Calc.Abs.Id string -> failure x

transProgram :: Calc.Abs.Program -> Result
transProgram x = case x of
  Calc.Abs.ProgDef defs -> failure x

transDef :: Calc.Abs.Def -> Result
transDef x = case x of
  Calc.Abs.QualConstDef qualconst -> failure x
  Calc.Abs.StmDef gentype inits -> failure x
  Calc.Abs.FuncDef gentype id args stms -> failure x
  Calc.Abs.FuncDef2 gentype id args -> failure x
  Calc.Abs.TypeDef gentype id -> failure x

transArg :: Calc.Abs.Arg -> Result
transArg x = case x of
  Calc.Abs.ArgDecl2 gentype init -> failure x
  Calc.Abs.ArgDecl3 gentype -> failure x

transStm :: Calc.Abs.Stm -> Result
transStm x = case x of
  Calc.Abs.InitStm gentype inits -> failure x
  Calc.Abs.StmExp exp -> failure x
  Calc.Abs.ReturnStm stm -> failure x
  Calc.Abs.WhileStm exp stm -> failure x
  Calc.Abs.ForStm gentype init exp1 exp2 stm -> failure x
  Calc.Abs.DoWhileStm stm exp -> failure x
  Calc.Abs.BlockStm stms -> failure x
  Calc.Abs.TypeDefStm gentype id -> failure x
  Calc.Abs.IfStm exp stm -> failure x
  Calc.Abs.IfElseStm exp stm1 stm2 -> failure x

transExp :: Calc.Abs.Exp -> Result
transExp x = case x of
  Calc.Abs.ThrowExcep exp -> failure x
  Calc.Abs.AssignExp exp1 exp2 -> failure x
  Calc.Abs.PlusAssigExp exp1 exp2 -> failure x
  Calc.Abs.MinusAssigExp exp1 exp2 -> failure x
  Calc.Abs.CondExp exp1 exp2 exp3 -> failure x
  Calc.Abs.DisjExp exp1 exp2 -> failure x
  Calc.Abs.ConjExp exp1 exp2 -> failure x
  Calc.Abs.EqExp exp1 exp2 -> failure x
  Calc.Abs.InEqExp exp1 exp2 -> failure x
  Calc.Abs.LessExp exp1 exp2 -> failure x
  Calc.Abs.LeqExp exp1 exp2 -> failure x
  Calc.Abs.GeqExp exp1 exp2 -> failure x
  Calc.Abs.GreaterExp exp1 exp2 -> failure x
  Calc.Abs.LShift exp1 exp2 -> failure x
  Calc.Abs.RShift exp1 exp2 -> failure x
  Calc.Abs.AddExp exp1 exp2 -> failure x
  Calc.Abs.MinExp exp1 exp2 -> failure x
  Calc.Abs.MulExp exp1 exp2 -> failure x
  Calc.Abs.DivExp exp1 exp2 -> failure x
  Calc.Abs.ModExp exp1 exp2 -> failure x
  Calc.Abs.Incr2Exp exp -> failure x
  Calc.Abs.Decr2Exp exp -> failure x
  Calc.Abs.NegExp exp -> failure x
  Calc.Abs.DeRefExp exp -> failure x
  Calc.Abs.Incr1Exp exp -> failure x
  Calc.Abs.Decr1Exp exp -> failure x
  Calc.Abs.IndexExp exp1 exp2 -> failure x
  Calc.Abs.FunCallExp exp exps -> failure x
  Calc.Abs.DotStrucProjExp exp1 exp2 -> failure x
  Calc.Abs.ArrStrucProjExp exp1 exp2 -> failure x
  Calc.Abs.IntExp integer -> failure x
  Calc.Abs.DoubleExp double -> failure x
  Calc.Abs.StringArrExp strings -> failure x
  Calc.Abs.CharExp char -> failure x
  Calc.Abs.QualConstExp qualconst -> failure x

transQualConst :: Calc.Abs.QualConst -> Result
transQualConst x = case x of
  Calc.Abs.QualConstDecls ids -> failure x

transType :: Calc.Abs.Type -> Result
transType x = case x of
  Calc.Abs.CharType -> failure x
  Calc.Abs.BoolType -> failure x
  Calc.Abs.DoubleType -> failure x
  Calc.Abs.IntType -> failure x
  Calc.Abs.VoidType -> failure x
  Calc.Abs.QualConstType qualconst -> failure x

transGenType :: Calc.Abs.GenType -> Result
transGenType x = case x of
  Calc.Abs.GenTypeDecl type_ -> failure x
  Calc.Abs.ConstGenType type_ -> failure x
  Calc.Abs.AndGenType type_ -> failure x
  Calc.Abs.CAndGenType type_ -> failure x

transInit :: Calc.Abs.Init -> Result
transInit x = case x of
  Calc.Abs.InitDecl id -> failure x
  Calc.Abs.InitAssign id exp -> failure x

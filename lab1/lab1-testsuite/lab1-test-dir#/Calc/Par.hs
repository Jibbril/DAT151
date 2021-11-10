{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module Calc.Par
  ( happyError
  , myLexer
  , pProgram
  ) where

import Prelude

import qualified Calc.Abs
import Calc.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Char)
	| HappyAbsSyn5 (Double)
	| HappyAbsSyn6 (Integer)
	| HappyAbsSyn7 (String)
	| HappyAbsSyn8 (Calc.Abs.Id)
	| HappyAbsSyn9 (Calc.Abs.Program)
	| HappyAbsSyn10 (Calc.Abs.Def)
	| HappyAbsSyn11 ([Calc.Abs.Def])
	| HappyAbsSyn12 ([Calc.Abs.Arg])
	| HappyAbsSyn13 (Calc.Abs.Arg)
	| HappyAbsSyn14 (Calc.Abs.Stm)
	| HappyAbsSyn15 ([Calc.Abs.Stm])
	| HappyAbsSyn16 (Calc.Abs.Exp)
	| HappyAbsSyn28 ([Calc.Abs.Exp])
	| HappyAbsSyn29 ([String])
	| HappyAbsSyn30 (Calc.Abs.QualConst)
	| HappyAbsSyn31 ([Calc.Abs.Id])
	| HappyAbsSyn32 (Calc.Abs.Type)
	| HappyAbsSyn33 (Calc.Abs.GenType)
	| HappyAbsSyn34 (Calc.Abs.Init)
	| HappyAbsSyn35 ([Calc.Abs.Init])

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158,
 action_159,
 action_160,
 action_161,
 action_162,
 action_163,
 action_164,
 action_165,
 action_166,
 action_167,
 action_168,
 action_169,
 action_170,
 action_171,
 action_172,
 action_173,
 action_174,
 action_175,
 action_176,
 action_177,
 action_178,
 action_179,
 action_180,
 action_181,
 action_182,
 action_183,
 action_184,
 action_185,
 action_186,
 action_187,
 action_188,
 action_189,
 action_190 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81,
 happyReduce_82,
 happyReduce_83,
 happyReduce_84,
 happyReduce_85,
 happyReduce_86,
 happyReduce_87,
 happyReduce_88,
 happyReduce_89,
 happyReduce_90,
 happyReduce_91,
 happyReduce_92,
 happyReduce_93,
 happyReduce_94,
 happyReduce_95,
 happyReduce_96,
 happyReduce_97,
 happyReduce_98,
 happyReduce_99,
 happyReduce_100,
 happyReduce_101,
 happyReduce_102,
 happyReduce_103 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,1350) ([0,0,0,0,35712,8220,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,58460,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,19456,132,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,35712,8208,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,256,0,0,16,0,0,0,0,0,32,256,0,0,0,0,1024,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,35712,8208,0,0,43072,8,0,7937,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,544,264,2048,0,0,16384,0,0,0,0,0,1024,0,4,0,0,0,0,40960,12,0,0,0,0,8192,8,0,0,0,16384,4,0,0,0,0,4224,64,0,0,0,0,0,0,0,0,0,0,4352,13,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,277,0,57344,3,0,33792,138,0,61456,1,0,16896,69,0,63488,0,0,41216,34,0,31744,0,0,20608,17,0,15872,0,0,43072,8,0,7937,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,64,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28672,529,4,0,0,32768,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,10768,2,16384,1984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,248,0,0,32,0,0,124,0,32768,4432,0,512,62,0,16384,2216,0,0,31,0,8192,1108,0,32768,15,0,4096,554,0,49152,7,0,2048,277,0,57344,3,0,33792,138,0,61440,1,0,16896,69,0,63488,0,0,41216,34,0,31744,0,0,20608,17,0,15872,0,0,43072,8,0,7936,0,0,21536,4,0,3968,0,0,10768,2,0,1984,0,0,5384,1,0,992,0,0,35460,0,0,496,0,0,17730,0,0,248,0,0,8865,0,0,124,0,32768,4432,0,0,62,0,16384,2216,0,0,31,0,8192,1108,0,32896,15,0,4096,554,0,49152,7,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,51712,0,0,0,0,0,25856,0,0,0,0,0,16640,0,0,0,0,0,8320,0,0,0,0,0,4160,0,0,0,0,0,2080,0,0,0,0,1088,0,0,0,0,0,544,0,0,0,0,16384,8200,0,0,0,0,8192,4100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8865,0,61407,124,0,0,0,0,0,0,0,16384,2216,49152,15351,31,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,16384,0,0,0,0,16896,69,48640,63967,0,0,8192,0,0,0,0,0,4096,0,0,0,0,0,43072,8,63424,7995,0,0,0,0,8928,2052,0,0,512,0,0,0,0,0,5384,1,32504,999,0,0,35460,0,4096,496,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,4432,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,2048,277,0,57376,3,0,0,0,0,0,1,0,0,0,0,0,0,0,41216,34,0,31748,0,0,0,0,35712,8208,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,32,0,0,16,0,0,0,0,0,0,2,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,33792,138,31744,62399,1,0,0,0,0,0,0,0,41216,34,57088,31983,0,0,0,2048,0,0,0,0,43072,8,0,7937,0,0,2048,0,0,0,0,0,10768,2,16384,1984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17730,0,57278,249,0,0,0,16,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,8192,1108,0,32896,15,0,0,0,0,0,0,0,0,2,0,0,0,0,33792,138,31744,62399,1,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","Char","Double","Integer","String","Id","Program","Def","ListDef","ListArg","Arg","Stm","ListStm","Exp1","Exp2","Exp3","Exp4","Exp8","Exp9","Exp10","Exp11","Exp12","Exp13","Exp14","Exp15","ListExp","ListString","QualConst","ListId","Type","GenType","Init","ListInit","Exp","Exp5","Exp6","Exp7","'!'","'!='","'%'","'&'","'&&'","'('","')'","'*'","'+'","'++'","'+='","','","'-'","'--'","'-='","'->'","'.'","'/'","':'","'::'","';'","'<'","'<<'","'<='","'='","'=='","'>'","'>='","'>>'","'?'","'['","']'","'bool'","'char'","'const'","'do'","'double'","'else'","'for'","'if'","'int'","'return'","'throw'","'typedef'","'using'","'void'","'while'","'{'","'||'","'}'","L_charac","L_doubl","L_integ","L_quoted","L_Id","%eof"]
        bit_start = st Prelude.* 95
        bit_end = (st Prelude.+ 1) Prelude.* 95
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..94]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (72) = happyShift action_11
action_0 (73) = happyShift action_12
action_0 (74) = happyShift action_13
action_0 (76) = happyShift action_14
action_0 (80) = happyShift action_15
action_0 (83) = happyShift action_16
action_0 (84) = happyShift action_17
action_0 (85) = happyShift action_18
action_0 (94) = happyShift action_19
action_0 (8) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 (10) = happyGoto action_5
action_0 (11) = happyGoto action_6
action_0 (30) = happyGoto action_7
action_0 (31) = happyGoto action_8
action_0 (32) = happyGoto action_9
action_0 (33) = happyGoto action_10
action_0 _ = happyReduce_12

action_1 (90) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (59) = happyShift action_28
action_3 _ = happyReduce_84

action_4 (95) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (72) = happyShift action_11
action_5 (73) = happyShift action_12
action_5 (74) = happyShift action_13
action_5 (76) = happyShift action_14
action_5 (80) = happyShift action_15
action_5 (83) = happyShift action_16
action_5 (84) = happyShift action_17
action_5 (85) = happyShift action_18
action_5 (94) = happyShift action_19
action_5 (8) = happyGoto action_3
action_5 (10) = happyGoto action_5
action_5 (11) = happyGoto action_27
action_5 (30) = happyGoto action_7
action_5 (31) = happyGoto action_8
action_5 (32) = happyGoto action_9
action_5 (33) = happyGoto action_10
action_5 _ = happyReduce_12

action_6 _ = happyReduce_6

action_7 _ = happyReduce_91

action_8 _ = happyReduce_83

action_9 (43) = happyShift action_26
action_9 _ = happyReduce_92

action_10 (94) = happyShift action_19
action_10 (8) = happyGoto action_23
action_10 (34) = happyGoto action_24
action_10 (35) = happyGoto action_25
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_87

action_12 _ = happyReduce_86

action_13 (72) = happyShift action_11
action_13 (73) = happyShift action_12
action_13 (76) = happyShift action_14
action_13 (80) = happyShift action_15
action_13 (85) = happyShift action_18
action_13 (94) = happyShift action_19
action_13 (8) = happyGoto action_3
action_13 (30) = happyGoto action_7
action_13 (31) = happyGoto action_8
action_13 (32) = happyGoto action_22
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_88

action_15 _ = happyReduce_89

action_16 (72) = happyShift action_11
action_16 (73) = happyShift action_12
action_16 (74) = happyShift action_13
action_16 (76) = happyShift action_14
action_16 (80) = happyShift action_15
action_16 (85) = happyShift action_18
action_16 (94) = happyShift action_19
action_16 (8) = happyGoto action_3
action_16 (30) = happyGoto action_7
action_16 (31) = happyGoto action_8
action_16 (32) = happyGoto action_9
action_16 (33) = happyGoto action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (94) = happyShift action_19
action_17 (8) = happyGoto action_3
action_17 (30) = happyGoto action_20
action_17 (31) = happyGoto action_8
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_90

action_19 _ = happyReduce_5

action_20 (60) = happyShift action_36
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (94) = happyShift action_19
action_21 (8) = happyGoto action_35
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (43) = happyShift action_34
action_22 _ = happyReduce_93

action_23 (45) = happyShift action_32
action_23 (64) = happyShift action_33
action_23 _ = happyReduce_96

action_24 (51) = happyShift action_31
action_24 _ = happyReduce_98

action_25 (60) = happyShift action_30
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_94

action_27 _ = happyReduce_13

action_28 (94) = happyShift action_19
action_28 (8) = happyGoto action_3
action_28 (31) = happyGoto action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_85

action_30 _ = happyReduce_8

action_31 (94) = happyShift action_19
action_31 (8) = happyGoto action_72
action_31 (34) = happyGoto action_24
action_31 (35) = happyGoto action_73
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (72) = happyShift action_11
action_32 (73) = happyShift action_12
action_32 (74) = happyShift action_13
action_32 (76) = happyShift action_14
action_32 (80) = happyShift action_15
action_32 (85) = happyShift action_18
action_32 (94) = happyShift action_19
action_32 (8) = happyGoto action_3
action_32 (12) = happyGoto action_69
action_32 (13) = happyGoto action_70
action_32 (30) = happyGoto action_7
action_32 (31) = happyGoto action_8
action_32 (32) = happyGoto action_9
action_32 (33) = happyGoto action_71
action_32 _ = happyReduce_14

action_33 (40) = happyShift action_60
action_33 (45) = happyShift action_61
action_33 (47) = happyShift action_62
action_33 (49) = happyShift action_63
action_33 (53) = happyShift action_64
action_33 (82) = happyShift action_65
action_33 (90) = happyShift action_2
action_33 (91) = happyShift action_66
action_33 (92) = happyShift action_67
action_33 (93) = happyShift action_68
action_33 (94) = happyShift action_19
action_33 (4) = happyGoto action_38
action_33 (5) = happyGoto action_39
action_33 (6) = happyGoto action_40
action_33 (7) = happyGoto action_41
action_33 (8) = happyGoto action_3
action_33 (16) = happyGoto action_42
action_33 (17) = happyGoto action_43
action_33 (18) = happyGoto action_44
action_33 (19) = happyGoto action_45
action_33 (20) = happyGoto action_46
action_33 (21) = happyGoto action_47
action_33 (22) = happyGoto action_48
action_33 (23) = happyGoto action_49
action_33 (24) = happyGoto action_50
action_33 (25) = happyGoto action_51
action_33 (26) = happyGoto action_52
action_33 (27) = happyGoto action_53
action_33 (29) = happyGoto action_54
action_33 (30) = happyGoto action_55
action_33 (31) = happyGoto action_8
action_33 (36) = happyGoto action_56
action_33 (37) = happyGoto action_57
action_33 (38) = happyGoto action_58
action_33 (39) = happyGoto action_59
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_95

action_35 (60) = happyShift action_37
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_7

action_37 _ = happyReduce_11

action_38 _ = happyReduce_75

action_39 _ = happyReduce_73

action_40 _ = happyReduce_72

action_41 (93) = happyShift action_68
action_41 (7) = happyGoto action_41
action_41 (29) = happyGoto action_108
action_41 _ = happyReduce_81

action_42 _ = happyReduce_100

action_43 _ = happyReduce_32

action_44 (50) = happyShift action_103
action_44 (54) = happyShift action_104
action_44 (64) = happyShift action_105
action_44 (69) = happyShift action_106
action_44 (88) = happyShift action_107
action_44 _ = happyReduce_37

action_45 (44) = happyShift action_102
action_45 _ = happyReduce_39

action_46 (41) = happyShift action_100
action_46 (65) = happyShift action_101
action_46 _ = happyReduce_103

action_47 (61) = happyShift action_96
action_47 (63) = happyShift action_97
action_47 (66) = happyShift action_98
action_47 (67) = happyShift action_99
action_47 _ = happyReduce_44

action_48 (62) = happyShift action_94
action_48 (68) = happyShift action_95
action_48 _ = happyReduce_49

action_49 (48) = happyShift action_92
action_49 (52) = happyShift action_93
action_49 _ = happyReduce_52

action_50 (42) = happyShift action_89
action_50 (47) = happyShift action_90
action_50 (57) = happyShift action_91
action_50 _ = happyReduce_55

action_51 _ = happyReduce_59

action_52 (45) = happyShift action_83
action_52 (49) = happyShift action_84
action_52 (53) = happyShift action_85
action_52 (55) = happyShift action_86
action_52 (56) = happyShift action_87
action_52 (70) = happyShift action_88
action_52 _ = happyReduce_64

action_53 _ = happyReduce_71

action_54 _ = happyReduce_74

action_55 _ = happyReduce_76

action_56 _ = happyReduce_97

action_57 _ = happyReduce_41

action_58 _ = happyReduce_101

action_59 _ = happyReduce_102

action_60 (40) = happyShift action_60
action_60 (45) = happyShift action_61
action_60 (47) = happyShift action_62
action_60 (49) = happyShift action_63
action_60 (53) = happyShift action_64
action_60 (90) = happyShift action_2
action_60 (91) = happyShift action_66
action_60 (92) = happyShift action_67
action_60 (93) = happyShift action_68
action_60 (94) = happyShift action_19
action_60 (4) = happyGoto action_38
action_60 (5) = happyGoto action_39
action_60 (6) = happyGoto action_40
action_60 (7) = happyGoto action_41
action_60 (8) = happyGoto action_3
action_60 (25) = happyGoto action_82
action_60 (26) = happyGoto action_52
action_60 (27) = happyGoto action_53
action_60 (29) = happyGoto action_54
action_60 (30) = happyGoto action_55
action_60 (31) = happyGoto action_8
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (40) = happyShift action_60
action_61 (45) = happyShift action_61
action_61 (47) = happyShift action_62
action_61 (49) = happyShift action_63
action_61 (53) = happyShift action_64
action_61 (82) = happyShift action_65
action_61 (90) = happyShift action_2
action_61 (91) = happyShift action_66
action_61 (92) = happyShift action_67
action_61 (93) = happyShift action_68
action_61 (94) = happyShift action_19
action_61 (4) = happyGoto action_38
action_61 (5) = happyGoto action_39
action_61 (6) = happyGoto action_40
action_61 (7) = happyGoto action_41
action_61 (8) = happyGoto action_3
action_61 (16) = happyGoto action_42
action_61 (17) = happyGoto action_43
action_61 (18) = happyGoto action_44
action_61 (19) = happyGoto action_45
action_61 (20) = happyGoto action_46
action_61 (21) = happyGoto action_47
action_61 (22) = happyGoto action_48
action_61 (23) = happyGoto action_49
action_61 (24) = happyGoto action_50
action_61 (25) = happyGoto action_51
action_61 (26) = happyGoto action_52
action_61 (27) = happyGoto action_53
action_61 (29) = happyGoto action_54
action_61 (30) = happyGoto action_55
action_61 (31) = happyGoto action_8
action_61 (36) = happyGoto action_81
action_61 (37) = happyGoto action_57
action_61 (38) = happyGoto action_58
action_61 (39) = happyGoto action_59
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (40) = happyShift action_60
action_62 (45) = happyShift action_61
action_62 (47) = happyShift action_62
action_62 (49) = happyShift action_63
action_62 (53) = happyShift action_64
action_62 (90) = happyShift action_2
action_62 (91) = happyShift action_66
action_62 (92) = happyShift action_67
action_62 (93) = happyShift action_68
action_62 (94) = happyShift action_19
action_62 (4) = happyGoto action_38
action_62 (5) = happyGoto action_39
action_62 (6) = happyGoto action_40
action_62 (7) = happyGoto action_41
action_62 (8) = happyGoto action_3
action_62 (25) = happyGoto action_80
action_62 (26) = happyGoto action_52
action_62 (27) = happyGoto action_53
action_62 (29) = happyGoto action_54
action_62 (30) = happyGoto action_55
action_62 (31) = happyGoto action_8
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (40) = happyShift action_60
action_63 (45) = happyShift action_61
action_63 (47) = happyShift action_62
action_63 (49) = happyShift action_63
action_63 (53) = happyShift action_64
action_63 (90) = happyShift action_2
action_63 (91) = happyShift action_66
action_63 (92) = happyShift action_67
action_63 (93) = happyShift action_68
action_63 (94) = happyShift action_19
action_63 (4) = happyGoto action_38
action_63 (5) = happyGoto action_39
action_63 (6) = happyGoto action_40
action_63 (7) = happyGoto action_41
action_63 (8) = happyGoto action_3
action_63 (25) = happyGoto action_79
action_63 (26) = happyGoto action_52
action_63 (27) = happyGoto action_53
action_63 (29) = happyGoto action_54
action_63 (30) = happyGoto action_55
action_63 (31) = happyGoto action_8
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (40) = happyShift action_60
action_64 (45) = happyShift action_61
action_64 (47) = happyShift action_62
action_64 (49) = happyShift action_63
action_64 (53) = happyShift action_64
action_64 (90) = happyShift action_2
action_64 (91) = happyShift action_66
action_64 (92) = happyShift action_67
action_64 (93) = happyShift action_68
action_64 (94) = happyShift action_19
action_64 (4) = happyGoto action_38
action_64 (5) = happyGoto action_39
action_64 (6) = happyGoto action_40
action_64 (7) = happyGoto action_41
action_64 (8) = happyGoto action_3
action_64 (25) = happyGoto action_78
action_64 (26) = happyGoto action_52
action_64 (27) = happyGoto action_53
action_64 (29) = happyGoto action_54
action_64 (30) = happyGoto action_55
action_64 (31) = happyGoto action_8
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (40) = happyShift action_60
action_65 (45) = happyShift action_61
action_65 (47) = happyShift action_62
action_65 (49) = happyShift action_63
action_65 (53) = happyShift action_64
action_65 (82) = happyShift action_65
action_65 (90) = happyShift action_2
action_65 (91) = happyShift action_66
action_65 (92) = happyShift action_67
action_65 (93) = happyShift action_68
action_65 (94) = happyShift action_19
action_65 (4) = happyGoto action_38
action_65 (5) = happyGoto action_39
action_65 (6) = happyGoto action_40
action_65 (7) = happyGoto action_41
action_65 (8) = happyGoto action_3
action_65 (16) = happyGoto action_77
action_65 (17) = happyGoto action_43
action_65 (18) = happyGoto action_44
action_65 (19) = happyGoto action_45
action_65 (20) = happyGoto action_46
action_65 (21) = happyGoto action_47
action_65 (22) = happyGoto action_48
action_65 (23) = happyGoto action_49
action_65 (24) = happyGoto action_50
action_65 (25) = happyGoto action_51
action_65 (26) = happyGoto action_52
action_65 (27) = happyGoto action_53
action_65 (29) = happyGoto action_54
action_65 (30) = happyGoto action_55
action_65 (31) = happyGoto action_8
action_65 (37) = happyGoto action_57
action_65 (38) = happyGoto action_58
action_65 (39) = happyGoto action_59
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_2

action_67 _ = happyReduce_3

action_68 _ = happyReduce_4

action_69 (46) = happyShift action_76
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (51) = happyShift action_75
action_70 _ = happyReduce_15

action_71 (94) = happyShift action_19
action_71 (8) = happyGoto action_72
action_71 (34) = happyGoto action_74
action_71 _ = happyReduce_18

action_72 (64) = happyShift action_33
action_72 _ = happyReduce_96

action_73 _ = happyReduce_99

action_74 _ = happyReduce_17

action_75 (72) = happyShift action_11
action_75 (73) = happyShift action_12
action_75 (74) = happyShift action_13
action_75 (76) = happyShift action_14
action_75 (80) = happyShift action_15
action_75 (85) = happyShift action_18
action_75 (94) = happyShift action_19
action_75 (8) = happyGoto action_3
action_75 (12) = happyGoto action_136
action_75 (13) = happyGoto action_70
action_75 (30) = happyGoto action_7
action_75 (31) = happyGoto action_8
action_75 (32) = happyGoto action_9
action_75 (33) = happyGoto action_71
action_75 _ = happyReduce_14

action_76 (60) = happyShift action_134
action_76 (87) = happyShift action_135
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_31

action_78 _ = happyReduce_61

action_79 _ = happyReduce_60

action_80 _ = happyReduce_63

action_81 (46) = happyShift action_133
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_62

action_83 (40) = happyShift action_60
action_83 (45) = happyShift action_61
action_83 (47) = happyShift action_62
action_83 (49) = happyShift action_63
action_83 (53) = happyShift action_64
action_83 (82) = happyShift action_65
action_83 (90) = happyShift action_2
action_83 (91) = happyShift action_66
action_83 (92) = happyShift action_67
action_83 (93) = happyShift action_68
action_83 (94) = happyShift action_19
action_83 (4) = happyGoto action_38
action_83 (5) = happyGoto action_39
action_83 (6) = happyGoto action_40
action_83 (7) = happyGoto action_41
action_83 (8) = happyGoto action_3
action_83 (16) = happyGoto action_42
action_83 (17) = happyGoto action_43
action_83 (18) = happyGoto action_44
action_83 (19) = happyGoto action_45
action_83 (20) = happyGoto action_46
action_83 (21) = happyGoto action_47
action_83 (22) = happyGoto action_48
action_83 (23) = happyGoto action_49
action_83 (24) = happyGoto action_50
action_83 (25) = happyGoto action_51
action_83 (26) = happyGoto action_52
action_83 (27) = happyGoto action_53
action_83 (28) = happyGoto action_131
action_83 (29) = happyGoto action_54
action_83 (30) = happyGoto action_55
action_83 (31) = happyGoto action_8
action_83 (36) = happyGoto action_132
action_83 (37) = happyGoto action_57
action_83 (38) = happyGoto action_58
action_83 (39) = happyGoto action_59
action_83 _ = happyReduce_78

action_84 _ = happyReduce_65

action_85 _ = happyReduce_66

action_86 (45) = happyShift action_61
action_86 (90) = happyShift action_2
action_86 (91) = happyShift action_66
action_86 (92) = happyShift action_67
action_86 (93) = happyShift action_68
action_86 (94) = happyShift action_19
action_86 (4) = happyGoto action_38
action_86 (5) = happyGoto action_39
action_86 (6) = happyGoto action_40
action_86 (7) = happyGoto action_41
action_86 (8) = happyGoto action_3
action_86 (27) = happyGoto action_130
action_86 (29) = happyGoto action_54
action_86 (30) = happyGoto action_55
action_86 (31) = happyGoto action_8
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (45) = happyShift action_61
action_87 (90) = happyShift action_2
action_87 (91) = happyShift action_66
action_87 (92) = happyShift action_67
action_87 (93) = happyShift action_68
action_87 (94) = happyShift action_19
action_87 (4) = happyGoto action_38
action_87 (5) = happyGoto action_39
action_87 (6) = happyGoto action_40
action_87 (7) = happyGoto action_41
action_87 (8) = happyGoto action_3
action_87 (27) = happyGoto action_129
action_87 (29) = happyGoto action_54
action_87 (30) = happyGoto action_55
action_87 (31) = happyGoto action_8
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (40) = happyShift action_60
action_88 (45) = happyShift action_61
action_88 (47) = happyShift action_62
action_88 (49) = happyShift action_63
action_88 (53) = happyShift action_64
action_88 (82) = happyShift action_65
action_88 (90) = happyShift action_2
action_88 (91) = happyShift action_66
action_88 (92) = happyShift action_67
action_88 (93) = happyShift action_68
action_88 (94) = happyShift action_19
action_88 (4) = happyGoto action_38
action_88 (5) = happyGoto action_39
action_88 (6) = happyGoto action_40
action_88 (7) = happyGoto action_41
action_88 (8) = happyGoto action_3
action_88 (16) = happyGoto action_42
action_88 (17) = happyGoto action_43
action_88 (18) = happyGoto action_44
action_88 (19) = happyGoto action_45
action_88 (20) = happyGoto action_46
action_88 (21) = happyGoto action_47
action_88 (22) = happyGoto action_48
action_88 (23) = happyGoto action_49
action_88 (24) = happyGoto action_50
action_88 (25) = happyGoto action_51
action_88 (26) = happyGoto action_52
action_88 (27) = happyGoto action_53
action_88 (29) = happyGoto action_54
action_88 (30) = happyGoto action_55
action_88 (31) = happyGoto action_8
action_88 (36) = happyGoto action_128
action_88 (37) = happyGoto action_57
action_88 (38) = happyGoto action_58
action_88 (39) = happyGoto action_59
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (40) = happyShift action_60
action_89 (45) = happyShift action_61
action_89 (47) = happyShift action_62
action_89 (49) = happyShift action_63
action_89 (53) = happyShift action_64
action_89 (90) = happyShift action_2
action_89 (91) = happyShift action_66
action_89 (92) = happyShift action_67
action_89 (93) = happyShift action_68
action_89 (94) = happyShift action_19
action_89 (4) = happyGoto action_38
action_89 (5) = happyGoto action_39
action_89 (6) = happyGoto action_40
action_89 (7) = happyGoto action_41
action_89 (8) = happyGoto action_3
action_89 (25) = happyGoto action_127
action_89 (26) = happyGoto action_52
action_89 (27) = happyGoto action_53
action_89 (29) = happyGoto action_54
action_89 (30) = happyGoto action_55
action_89 (31) = happyGoto action_8
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (40) = happyShift action_60
action_90 (45) = happyShift action_61
action_90 (47) = happyShift action_62
action_90 (49) = happyShift action_63
action_90 (53) = happyShift action_64
action_90 (90) = happyShift action_2
action_90 (91) = happyShift action_66
action_90 (92) = happyShift action_67
action_90 (93) = happyShift action_68
action_90 (94) = happyShift action_19
action_90 (4) = happyGoto action_38
action_90 (5) = happyGoto action_39
action_90 (6) = happyGoto action_40
action_90 (7) = happyGoto action_41
action_90 (8) = happyGoto action_3
action_90 (25) = happyGoto action_126
action_90 (26) = happyGoto action_52
action_90 (27) = happyGoto action_53
action_90 (29) = happyGoto action_54
action_90 (30) = happyGoto action_55
action_90 (31) = happyGoto action_8
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (40) = happyShift action_60
action_91 (45) = happyShift action_61
action_91 (47) = happyShift action_62
action_91 (49) = happyShift action_63
action_91 (53) = happyShift action_64
action_91 (90) = happyShift action_2
action_91 (91) = happyShift action_66
action_91 (92) = happyShift action_67
action_91 (93) = happyShift action_68
action_91 (94) = happyShift action_19
action_91 (4) = happyGoto action_38
action_91 (5) = happyGoto action_39
action_91 (6) = happyGoto action_40
action_91 (7) = happyGoto action_41
action_91 (8) = happyGoto action_3
action_91 (25) = happyGoto action_125
action_91 (26) = happyGoto action_52
action_91 (27) = happyGoto action_53
action_91 (29) = happyGoto action_54
action_91 (30) = happyGoto action_55
action_91 (31) = happyGoto action_8
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (40) = happyShift action_60
action_92 (45) = happyShift action_61
action_92 (47) = happyShift action_62
action_92 (49) = happyShift action_63
action_92 (53) = happyShift action_64
action_92 (90) = happyShift action_2
action_92 (91) = happyShift action_66
action_92 (92) = happyShift action_67
action_92 (93) = happyShift action_68
action_92 (94) = happyShift action_19
action_92 (4) = happyGoto action_38
action_92 (5) = happyGoto action_39
action_92 (6) = happyGoto action_40
action_92 (7) = happyGoto action_41
action_92 (8) = happyGoto action_3
action_92 (24) = happyGoto action_124
action_92 (25) = happyGoto action_51
action_92 (26) = happyGoto action_52
action_92 (27) = happyGoto action_53
action_92 (29) = happyGoto action_54
action_92 (30) = happyGoto action_55
action_92 (31) = happyGoto action_8
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (40) = happyShift action_60
action_93 (45) = happyShift action_61
action_93 (47) = happyShift action_62
action_93 (49) = happyShift action_63
action_93 (53) = happyShift action_64
action_93 (90) = happyShift action_2
action_93 (91) = happyShift action_66
action_93 (92) = happyShift action_67
action_93 (93) = happyShift action_68
action_93 (94) = happyShift action_19
action_93 (4) = happyGoto action_38
action_93 (5) = happyGoto action_39
action_93 (6) = happyGoto action_40
action_93 (7) = happyGoto action_41
action_93 (8) = happyGoto action_3
action_93 (24) = happyGoto action_123
action_93 (25) = happyGoto action_51
action_93 (26) = happyGoto action_52
action_93 (27) = happyGoto action_53
action_93 (29) = happyGoto action_54
action_93 (30) = happyGoto action_55
action_93 (31) = happyGoto action_8
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (40) = happyShift action_60
action_94 (45) = happyShift action_61
action_94 (47) = happyShift action_62
action_94 (49) = happyShift action_63
action_94 (53) = happyShift action_64
action_94 (90) = happyShift action_2
action_94 (91) = happyShift action_66
action_94 (92) = happyShift action_67
action_94 (93) = happyShift action_68
action_94 (94) = happyShift action_19
action_94 (4) = happyGoto action_38
action_94 (5) = happyGoto action_39
action_94 (6) = happyGoto action_40
action_94 (7) = happyGoto action_41
action_94 (8) = happyGoto action_3
action_94 (23) = happyGoto action_122
action_94 (24) = happyGoto action_50
action_94 (25) = happyGoto action_51
action_94 (26) = happyGoto action_52
action_94 (27) = happyGoto action_53
action_94 (29) = happyGoto action_54
action_94 (30) = happyGoto action_55
action_94 (31) = happyGoto action_8
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (40) = happyShift action_60
action_95 (45) = happyShift action_61
action_95 (47) = happyShift action_62
action_95 (49) = happyShift action_63
action_95 (53) = happyShift action_64
action_95 (90) = happyShift action_2
action_95 (91) = happyShift action_66
action_95 (92) = happyShift action_67
action_95 (93) = happyShift action_68
action_95 (94) = happyShift action_19
action_95 (4) = happyGoto action_38
action_95 (5) = happyGoto action_39
action_95 (6) = happyGoto action_40
action_95 (7) = happyGoto action_41
action_95 (8) = happyGoto action_3
action_95 (23) = happyGoto action_121
action_95 (24) = happyGoto action_50
action_95 (25) = happyGoto action_51
action_95 (26) = happyGoto action_52
action_95 (27) = happyGoto action_53
action_95 (29) = happyGoto action_54
action_95 (30) = happyGoto action_55
action_95 (31) = happyGoto action_8
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (40) = happyShift action_60
action_96 (45) = happyShift action_61
action_96 (47) = happyShift action_62
action_96 (49) = happyShift action_63
action_96 (53) = happyShift action_64
action_96 (90) = happyShift action_2
action_96 (91) = happyShift action_66
action_96 (92) = happyShift action_67
action_96 (93) = happyShift action_68
action_96 (94) = happyShift action_19
action_96 (4) = happyGoto action_38
action_96 (5) = happyGoto action_39
action_96 (6) = happyGoto action_40
action_96 (7) = happyGoto action_41
action_96 (8) = happyGoto action_3
action_96 (22) = happyGoto action_120
action_96 (23) = happyGoto action_49
action_96 (24) = happyGoto action_50
action_96 (25) = happyGoto action_51
action_96 (26) = happyGoto action_52
action_96 (27) = happyGoto action_53
action_96 (29) = happyGoto action_54
action_96 (30) = happyGoto action_55
action_96 (31) = happyGoto action_8
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (40) = happyShift action_60
action_97 (45) = happyShift action_61
action_97 (47) = happyShift action_62
action_97 (49) = happyShift action_63
action_97 (53) = happyShift action_64
action_97 (90) = happyShift action_2
action_97 (91) = happyShift action_66
action_97 (92) = happyShift action_67
action_97 (93) = happyShift action_68
action_97 (94) = happyShift action_19
action_97 (4) = happyGoto action_38
action_97 (5) = happyGoto action_39
action_97 (6) = happyGoto action_40
action_97 (7) = happyGoto action_41
action_97 (8) = happyGoto action_3
action_97 (22) = happyGoto action_119
action_97 (23) = happyGoto action_49
action_97 (24) = happyGoto action_50
action_97 (25) = happyGoto action_51
action_97 (26) = happyGoto action_52
action_97 (27) = happyGoto action_53
action_97 (29) = happyGoto action_54
action_97 (30) = happyGoto action_55
action_97 (31) = happyGoto action_8
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (40) = happyShift action_60
action_98 (45) = happyShift action_61
action_98 (47) = happyShift action_62
action_98 (49) = happyShift action_63
action_98 (53) = happyShift action_64
action_98 (90) = happyShift action_2
action_98 (91) = happyShift action_66
action_98 (92) = happyShift action_67
action_98 (93) = happyShift action_68
action_98 (94) = happyShift action_19
action_98 (4) = happyGoto action_38
action_98 (5) = happyGoto action_39
action_98 (6) = happyGoto action_40
action_98 (7) = happyGoto action_41
action_98 (8) = happyGoto action_3
action_98 (22) = happyGoto action_118
action_98 (23) = happyGoto action_49
action_98 (24) = happyGoto action_50
action_98 (25) = happyGoto action_51
action_98 (26) = happyGoto action_52
action_98 (27) = happyGoto action_53
action_98 (29) = happyGoto action_54
action_98 (30) = happyGoto action_55
action_98 (31) = happyGoto action_8
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (40) = happyShift action_60
action_99 (45) = happyShift action_61
action_99 (47) = happyShift action_62
action_99 (49) = happyShift action_63
action_99 (53) = happyShift action_64
action_99 (90) = happyShift action_2
action_99 (91) = happyShift action_66
action_99 (92) = happyShift action_67
action_99 (93) = happyShift action_68
action_99 (94) = happyShift action_19
action_99 (4) = happyGoto action_38
action_99 (5) = happyGoto action_39
action_99 (6) = happyGoto action_40
action_99 (7) = happyGoto action_41
action_99 (8) = happyGoto action_3
action_99 (22) = happyGoto action_117
action_99 (23) = happyGoto action_49
action_99 (24) = happyGoto action_50
action_99 (25) = happyGoto action_51
action_99 (26) = happyGoto action_52
action_99 (27) = happyGoto action_53
action_99 (29) = happyGoto action_54
action_99 (30) = happyGoto action_55
action_99 (31) = happyGoto action_8
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (40) = happyShift action_60
action_100 (45) = happyShift action_61
action_100 (47) = happyShift action_62
action_100 (49) = happyShift action_63
action_100 (53) = happyShift action_64
action_100 (90) = happyShift action_2
action_100 (91) = happyShift action_66
action_100 (92) = happyShift action_67
action_100 (93) = happyShift action_68
action_100 (94) = happyShift action_19
action_100 (4) = happyGoto action_38
action_100 (5) = happyGoto action_39
action_100 (6) = happyGoto action_40
action_100 (7) = happyGoto action_41
action_100 (8) = happyGoto action_3
action_100 (21) = happyGoto action_116
action_100 (22) = happyGoto action_48
action_100 (23) = happyGoto action_49
action_100 (24) = happyGoto action_50
action_100 (25) = happyGoto action_51
action_100 (26) = happyGoto action_52
action_100 (27) = happyGoto action_53
action_100 (29) = happyGoto action_54
action_100 (30) = happyGoto action_55
action_100 (31) = happyGoto action_8
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (40) = happyShift action_60
action_101 (45) = happyShift action_61
action_101 (47) = happyShift action_62
action_101 (49) = happyShift action_63
action_101 (53) = happyShift action_64
action_101 (90) = happyShift action_2
action_101 (91) = happyShift action_66
action_101 (92) = happyShift action_67
action_101 (93) = happyShift action_68
action_101 (94) = happyShift action_19
action_101 (4) = happyGoto action_38
action_101 (5) = happyGoto action_39
action_101 (6) = happyGoto action_40
action_101 (7) = happyGoto action_41
action_101 (8) = happyGoto action_3
action_101 (21) = happyGoto action_115
action_101 (22) = happyGoto action_48
action_101 (23) = happyGoto action_49
action_101 (24) = happyGoto action_50
action_101 (25) = happyGoto action_51
action_101 (26) = happyGoto action_52
action_101 (27) = happyGoto action_53
action_101 (29) = happyGoto action_54
action_101 (30) = happyGoto action_55
action_101 (31) = happyGoto action_8
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (40) = happyShift action_60
action_102 (45) = happyShift action_61
action_102 (47) = happyShift action_62
action_102 (49) = happyShift action_63
action_102 (53) = happyShift action_64
action_102 (90) = happyShift action_2
action_102 (91) = happyShift action_66
action_102 (92) = happyShift action_67
action_102 (93) = happyShift action_68
action_102 (94) = happyShift action_19
action_102 (4) = happyGoto action_38
action_102 (5) = happyGoto action_39
action_102 (6) = happyGoto action_40
action_102 (7) = happyGoto action_41
action_102 (8) = happyGoto action_3
action_102 (20) = happyGoto action_46
action_102 (21) = happyGoto action_47
action_102 (22) = happyGoto action_48
action_102 (23) = happyGoto action_49
action_102 (24) = happyGoto action_50
action_102 (25) = happyGoto action_51
action_102 (26) = happyGoto action_52
action_102 (27) = happyGoto action_53
action_102 (29) = happyGoto action_54
action_102 (30) = happyGoto action_55
action_102 (31) = happyGoto action_8
action_102 (37) = happyGoto action_114
action_102 (38) = happyGoto action_58
action_102 (39) = happyGoto action_59
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (40) = happyShift action_60
action_103 (45) = happyShift action_61
action_103 (47) = happyShift action_62
action_103 (49) = happyShift action_63
action_103 (53) = happyShift action_64
action_103 (90) = happyShift action_2
action_103 (91) = happyShift action_66
action_103 (92) = happyShift action_67
action_103 (93) = happyShift action_68
action_103 (94) = happyShift action_19
action_103 (4) = happyGoto action_38
action_103 (5) = happyGoto action_39
action_103 (6) = happyGoto action_40
action_103 (7) = happyGoto action_41
action_103 (8) = happyGoto action_3
action_103 (17) = happyGoto action_113
action_103 (18) = happyGoto action_44
action_103 (19) = happyGoto action_45
action_103 (20) = happyGoto action_46
action_103 (21) = happyGoto action_47
action_103 (22) = happyGoto action_48
action_103 (23) = happyGoto action_49
action_103 (24) = happyGoto action_50
action_103 (25) = happyGoto action_51
action_103 (26) = happyGoto action_52
action_103 (27) = happyGoto action_53
action_103 (29) = happyGoto action_54
action_103 (30) = happyGoto action_55
action_103 (31) = happyGoto action_8
action_103 (37) = happyGoto action_57
action_103 (38) = happyGoto action_58
action_103 (39) = happyGoto action_59
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (40) = happyShift action_60
action_104 (45) = happyShift action_61
action_104 (47) = happyShift action_62
action_104 (49) = happyShift action_63
action_104 (53) = happyShift action_64
action_104 (90) = happyShift action_2
action_104 (91) = happyShift action_66
action_104 (92) = happyShift action_67
action_104 (93) = happyShift action_68
action_104 (94) = happyShift action_19
action_104 (4) = happyGoto action_38
action_104 (5) = happyGoto action_39
action_104 (6) = happyGoto action_40
action_104 (7) = happyGoto action_41
action_104 (8) = happyGoto action_3
action_104 (17) = happyGoto action_112
action_104 (18) = happyGoto action_44
action_104 (19) = happyGoto action_45
action_104 (20) = happyGoto action_46
action_104 (21) = happyGoto action_47
action_104 (22) = happyGoto action_48
action_104 (23) = happyGoto action_49
action_104 (24) = happyGoto action_50
action_104 (25) = happyGoto action_51
action_104 (26) = happyGoto action_52
action_104 (27) = happyGoto action_53
action_104 (29) = happyGoto action_54
action_104 (30) = happyGoto action_55
action_104 (31) = happyGoto action_8
action_104 (37) = happyGoto action_57
action_104 (38) = happyGoto action_58
action_104 (39) = happyGoto action_59
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (40) = happyShift action_60
action_105 (45) = happyShift action_61
action_105 (47) = happyShift action_62
action_105 (49) = happyShift action_63
action_105 (53) = happyShift action_64
action_105 (90) = happyShift action_2
action_105 (91) = happyShift action_66
action_105 (92) = happyShift action_67
action_105 (93) = happyShift action_68
action_105 (94) = happyShift action_19
action_105 (4) = happyGoto action_38
action_105 (5) = happyGoto action_39
action_105 (6) = happyGoto action_40
action_105 (7) = happyGoto action_41
action_105 (8) = happyGoto action_3
action_105 (17) = happyGoto action_111
action_105 (18) = happyGoto action_44
action_105 (19) = happyGoto action_45
action_105 (20) = happyGoto action_46
action_105 (21) = happyGoto action_47
action_105 (22) = happyGoto action_48
action_105 (23) = happyGoto action_49
action_105 (24) = happyGoto action_50
action_105 (25) = happyGoto action_51
action_105 (26) = happyGoto action_52
action_105 (27) = happyGoto action_53
action_105 (29) = happyGoto action_54
action_105 (30) = happyGoto action_55
action_105 (31) = happyGoto action_8
action_105 (37) = happyGoto action_57
action_105 (38) = happyGoto action_58
action_105 (39) = happyGoto action_59
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (40) = happyShift action_60
action_106 (45) = happyShift action_61
action_106 (47) = happyShift action_62
action_106 (49) = happyShift action_63
action_106 (53) = happyShift action_64
action_106 (82) = happyShift action_65
action_106 (90) = happyShift action_2
action_106 (91) = happyShift action_66
action_106 (92) = happyShift action_67
action_106 (93) = happyShift action_68
action_106 (94) = happyShift action_19
action_106 (4) = happyGoto action_38
action_106 (5) = happyGoto action_39
action_106 (6) = happyGoto action_40
action_106 (7) = happyGoto action_41
action_106 (8) = happyGoto action_3
action_106 (16) = happyGoto action_42
action_106 (17) = happyGoto action_43
action_106 (18) = happyGoto action_44
action_106 (19) = happyGoto action_45
action_106 (20) = happyGoto action_46
action_106 (21) = happyGoto action_47
action_106 (22) = happyGoto action_48
action_106 (23) = happyGoto action_49
action_106 (24) = happyGoto action_50
action_106 (25) = happyGoto action_51
action_106 (26) = happyGoto action_52
action_106 (27) = happyGoto action_53
action_106 (29) = happyGoto action_54
action_106 (30) = happyGoto action_55
action_106 (31) = happyGoto action_8
action_106 (36) = happyGoto action_110
action_106 (37) = happyGoto action_57
action_106 (38) = happyGoto action_58
action_106 (39) = happyGoto action_59
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (40) = happyShift action_60
action_107 (45) = happyShift action_61
action_107 (47) = happyShift action_62
action_107 (49) = happyShift action_63
action_107 (53) = happyShift action_64
action_107 (90) = happyShift action_2
action_107 (91) = happyShift action_66
action_107 (92) = happyShift action_67
action_107 (93) = happyShift action_68
action_107 (94) = happyShift action_19
action_107 (4) = happyGoto action_38
action_107 (5) = happyGoto action_39
action_107 (6) = happyGoto action_40
action_107 (7) = happyGoto action_41
action_107 (8) = happyGoto action_3
action_107 (19) = happyGoto action_109
action_107 (20) = happyGoto action_46
action_107 (21) = happyGoto action_47
action_107 (22) = happyGoto action_48
action_107 (23) = happyGoto action_49
action_107 (24) = happyGoto action_50
action_107 (25) = happyGoto action_51
action_107 (26) = happyGoto action_52
action_107 (27) = happyGoto action_53
action_107 (29) = happyGoto action_54
action_107 (30) = happyGoto action_55
action_107 (31) = happyGoto action_8
action_107 (37) = happyGoto action_57
action_107 (38) = happyGoto action_58
action_107 (39) = happyGoto action_59
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_82

action_109 (44) = happyShift action_102
action_109 _ = happyReduce_38

action_110 (58) = happyShift action_152
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_33

action_112 _ = happyReduce_35

action_113 _ = happyReduce_34

action_114 _ = happyReduce_40

action_115 (61) = happyShift action_96
action_115 (63) = happyShift action_97
action_115 (66) = happyShift action_98
action_115 (67) = happyShift action_99
action_115 _ = happyReduce_42

action_116 (61) = happyShift action_96
action_116 (63) = happyShift action_97
action_116 (66) = happyShift action_98
action_116 (67) = happyShift action_99
action_116 _ = happyReduce_43

action_117 (62) = happyShift action_94
action_117 (68) = happyShift action_95
action_117 _ = happyReduce_47

action_118 (62) = happyShift action_94
action_118 (68) = happyShift action_95
action_118 _ = happyReduce_48

action_119 (62) = happyShift action_94
action_119 (68) = happyShift action_95
action_119 _ = happyReduce_46

action_120 (62) = happyShift action_94
action_120 (68) = happyShift action_95
action_120 _ = happyReduce_45

action_121 (48) = happyShift action_92
action_121 (52) = happyShift action_93
action_121 _ = happyReduce_51

action_122 (48) = happyShift action_92
action_122 (52) = happyShift action_93
action_122 _ = happyReduce_50

action_123 (42) = happyShift action_89
action_123 (47) = happyShift action_90
action_123 (57) = happyShift action_91
action_123 _ = happyReduce_54

action_124 (42) = happyShift action_89
action_124 (47) = happyShift action_90
action_124 (57) = happyShift action_91
action_124 _ = happyReduce_53

action_125 _ = happyReduce_57

action_126 _ = happyReduce_56

action_127 _ = happyReduce_58

action_128 (71) = happyShift action_151
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_69

action_130 _ = happyReduce_70

action_131 (46) = happyShift action_150
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (51) = happyShift action_149
action_132 _ = happyReduce_79

action_133 _ = happyReduce_77

action_134 _ = happyReduce_10

action_135 (40) = happyShift action_60
action_135 (45) = happyShift action_61
action_135 (47) = happyShift action_62
action_135 (49) = happyShift action_63
action_135 (53) = happyShift action_64
action_135 (72) = happyShift action_11
action_135 (73) = happyShift action_12
action_135 (74) = happyShift action_13
action_135 (75) = happyShift action_142
action_135 (76) = happyShift action_14
action_135 (78) = happyShift action_143
action_135 (79) = happyShift action_144
action_135 (80) = happyShift action_15
action_135 (81) = happyShift action_145
action_135 (82) = happyShift action_65
action_135 (83) = happyShift action_146
action_135 (85) = happyShift action_18
action_135 (86) = happyShift action_147
action_135 (87) = happyShift action_148
action_135 (90) = happyShift action_2
action_135 (91) = happyShift action_66
action_135 (92) = happyShift action_67
action_135 (93) = happyShift action_68
action_135 (94) = happyShift action_19
action_135 (4) = happyGoto action_38
action_135 (5) = happyGoto action_39
action_135 (6) = happyGoto action_40
action_135 (7) = happyGoto action_41
action_135 (8) = happyGoto action_3
action_135 (14) = happyGoto action_137
action_135 (15) = happyGoto action_138
action_135 (16) = happyGoto action_42
action_135 (17) = happyGoto action_43
action_135 (18) = happyGoto action_44
action_135 (19) = happyGoto action_45
action_135 (20) = happyGoto action_46
action_135 (21) = happyGoto action_47
action_135 (22) = happyGoto action_48
action_135 (23) = happyGoto action_49
action_135 (24) = happyGoto action_50
action_135 (25) = happyGoto action_51
action_135 (26) = happyGoto action_52
action_135 (27) = happyGoto action_53
action_135 (29) = happyGoto action_54
action_135 (30) = happyGoto action_139
action_135 (31) = happyGoto action_8
action_135 (32) = happyGoto action_9
action_135 (33) = happyGoto action_140
action_135 (36) = happyGoto action_141
action_135 (37) = happyGoto action_57
action_135 (38) = happyGoto action_58
action_135 (39) = happyGoto action_59
action_135 _ = happyReduce_29

action_136 _ = happyReduce_16

action_137 (40) = happyShift action_60
action_137 (45) = happyShift action_61
action_137 (47) = happyShift action_62
action_137 (49) = happyShift action_63
action_137 (53) = happyShift action_64
action_137 (72) = happyShift action_11
action_137 (73) = happyShift action_12
action_137 (74) = happyShift action_13
action_137 (75) = happyShift action_142
action_137 (76) = happyShift action_14
action_137 (78) = happyShift action_143
action_137 (79) = happyShift action_144
action_137 (80) = happyShift action_15
action_137 (81) = happyShift action_145
action_137 (82) = happyShift action_65
action_137 (83) = happyShift action_146
action_137 (85) = happyShift action_18
action_137 (86) = happyShift action_147
action_137 (87) = happyShift action_148
action_137 (90) = happyShift action_2
action_137 (91) = happyShift action_66
action_137 (92) = happyShift action_67
action_137 (93) = happyShift action_68
action_137 (94) = happyShift action_19
action_137 (4) = happyGoto action_38
action_137 (5) = happyGoto action_39
action_137 (6) = happyGoto action_40
action_137 (7) = happyGoto action_41
action_137 (8) = happyGoto action_3
action_137 (14) = happyGoto action_137
action_137 (15) = happyGoto action_165
action_137 (16) = happyGoto action_42
action_137 (17) = happyGoto action_43
action_137 (18) = happyGoto action_44
action_137 (19) = happyGoto action_45
action_137 (20) = happyGoto action_46
action_137 (21) = happyGoto action_47
action_137 (22) = happyGoto action_48
action_137 (23) = happyGoto action_49
action_137 (24) = happyGoto action_50
action_137 (25) = happyGoto action_51
action_137 (26) = happyGoto action_52
action_137 (27) = happyGoto action_53
action_137 (29) = happyGoto action_54
action_137 (30) = happyGoto action_139
action_137 (31) = happyGoto action_8
action_137 (32) = happyGoto action_9
action_137 (33) = happyGoto action_140
action_137 (36) = happyGoto action_141
action_137 (37) = happyGoto action_57
action_137 (38) = happyGoto action_58
action_137 (39) = happyGoto action_59
action_137 _ = happyReduce_29

action_138 (89) = happyShift action_164
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (43) = happyReduce_91
action_139 (94) = happyReduce_91
action_139 _ = happyReduce_76

action_140 (94) = happyShift action_19
action_140 (8) = happyGoto action_72
action_140 (34) = happyGoto action_24
action_140 (35) = happyGoto action_163
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (60) = happyShift action_162
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (40) = happyShift action_60
action_142 (45) = happyShift action_61
action_142 (47) = happyShift action_62
action_142 (49) = happyShift action_63
action_142 (53) = happyShift action_64
action_142 (72) = happyShift action_11
action_142 (73) = happyShift action_12
action_142 (74) = happyShift action_13
action_142 (75) = happyShift action_142
action_142 (76) = happyShift action_14
action_142 (78) = happyShift action_143
action_142 (79) = happyShift action_144
action_142 (80) = happyShift action_15
action_142 (81) = happyShift action_145
action_142 (82) = happyShift action_65
action_142 (83) = happyShift action_146
action_142 (85) = happyShift action_18
action_142 (86) = happyShift action_147
action_142 (87) = happyShift action_148
action_142 (90) = happyShift action_2
action_142 (91) = happyShift action_66
action_142 (92) = happyShift action_67
action_142 (93) = happyShift action_68
action_142 (94) = happyShift action_19
action_142 (4) = happyGoto action_38
action_142 (5) = happyGoto action_39
action_142 (6) = happyGoto action_40
action_142 (7) = happyGoto action_41
action_142 (8) = happyGoto action_3
action_142 (14) = happyGoto action_161
action_142 (16) = happyGoto action_42
action_142 (17) = happyGoto action_43
action_142 (18) = happyGoto action_44
action_142 (19) = happyGoto action_45
action_142 (20) = happyGoto action_46
action_142 (21) = happyGoto action_47
action_142 (22) = happyGoto action_48
action_142 (23) = happyGoto action_49
action_142 (24) = happyGoto action_50
action_142 (25) = happyGoto action_51
action_142 (26) = happyGoto action_52
action_142 (27) = happyGoto action_53
action_142 (29) = happyGoto action_54
action_142 (30) = happyGoto action_139
action_142 (31) = happyGoto action_8
action_142 (32) = happyGoto action_9
action_142 (33) = happyGoto action_140
action_142 (36) = happyGoto action_141
action_142 (37) = happyGoto action_57
action_142 (38) = happyGoto action_58
action_142 (39) = happyGoto action_59
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (45) = happyShift action_160
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (45) = happyShift action_159
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (40) = happyShift action_60
action_145 (45) = happyShift action_61
action_145 (47) = happyShift action_62
action_145 (49) = happyShift action_63
action_145 (53) = happyShift action_64
action_145 (72) = happyShift action_11
action_145 (73) = happyShift action_12
action_145 (74) = happyShift action_13
action_145 (75) = happyShift action_142
action_145 (76) = happyShift action_14
action_145 (78) = happyShift action_143
action_145 (79) = happyShift action_144
action_145 (80) = happyShift action_15
action_145 (81) = happyShift action_145
action_145 (82) = happyShift action_65
action_145 (83) = happyShift action_146
action_145 (85) = happyShift action_18
action_145 (86) = happyShift action_147
action_145 (87) = happyShift action_148
action_145 (90) = happyShift action_2
action_145 (91) = happyShift action_66
action_145 (92) = happyShift action_67
action_145 (93) = happyShift action_68
action_145 (94) = happyShift action_19
action_145 (4) = happyGoto action_38
action_145 (5) = happyGoto action_39
action_145 (6) = happyGoto action_40
action_145 (7) = happyGoto action_41
action_145 (8) = happyGoto action_3
action_145 (14) = happyGoto action_158
action_145 (16) = happyGoto action_42
action_145 (17) = happyGoto action_43
action_145 (18) = happyGoto action_44
action_145 (19) = happyGoto action_45
action_145 (20) = happyGoto action_46
action_145 (21) = happyGoto action_47
action_145 (22) = happyGoto action_48
action_145 (23) = happyGoto action_49
action_145 (24) = happyGoto action_50
action_145 (25) = happyGoto action_51
action_145 (26) = happyGoto action_52
action_145 (27) = happyGoto action_53
action_145 (29) = happyGoto action_54
action_145 (30) = happyGoto action_139
action_145 (31) = happyGoto action_8
action_145 (32) = happyGoto action_9
action_145 (33) = happyGoto action_140
action_145 (36) = happyGoto action_141
action_145 (37) = happyGoto action_57
action_145 (38) = happyGoto action_58
action_145 (39) = happyGoto action_59
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (72) = happyShift action_11
action_146 (73) = happyShift action_12
action_146 (74) = happyShift action_13
action_146 (76) = happyShift action_14
action_146 (80) = happyShift action_15
action_146 (85) = happyShift action_18
action_146 (94) = happyShift action_19
action_146 (8) = happyGoto action_3
action_146 (30) = happyGoto action_7
action_146 (31) = happyGoto action_8
action_146 (32) = happyGoto action_9
action_146 (33) = happyGoto action_157
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (45) = happyShift action_156
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (40) = happyShift action_60
action_148 (45) = happyShift action_61
action_148 (47) = happyShift action_62
action_148 (49) = happyShift action_63
action_148 (53) = happyShift action_64
action_148 (72) = happyShift action_11
action_148 (73) = happyShift action_12
action_148 (74) = happyShift action_13
action_148 (75) = happyShift action_142
action_148 (76) = happyShift action_14
action_148 (78) = happyShift action_143
action_148 (79) = happyShift action_144
action_148 (80) = happyShift action_15
action_148 (81) = happyShift action_145
action_148 (82) = happyShift action_65
action_148 (83) = happyShift action_146
action_148 (85) = happyShift action_18
action_148 (86) = happyShift action_147
action_148 (87) = happyShift action_148
action_148 (90) = happyShift action_2
action_148 (91) = happyShift action_66
action_148 (92) = happyShift action_67
action_148 (93) = happyShift action_68
action_148 (94) = happyShift action_19
action_148 (4) = happyGoto action_38
action_148 (5) = happyGoto action_39
action_148 (6) = happyGoto action_40
action_148 (7) = happyGoto action_41
action_148 (8) = happyGoto action_3
action_148 (14) = happyGoto action_137
action_148 (15) = happyGoto action_155
action_148 (16) = happyGoto action_42
action_148 (17) = happyGoto action_43
action_148 (18) = happyGoto action_44
action_148 (19) = happyGoto action_45
action_148 (20) = happyGoto action_46
action_148 (21) = happyGoto action_47
action_148 (22) = happyGoto action_48
action_148 (23) = happyGoto action_49
action_148 (24) = happyGoto action_50
action_148 (25) = happyGoto action_51
action_148 (26) = happyGoto action_52
action_148 (27) = happyGoto action_53
action_148 (29) = happyGoto action_54
action_148 (30) = happyGoto action_139
action_148 (31) = happyGoto action_8
action_148 (32) = happyGoto action_9
action_148 (33) = happyGoto action_140
action_148 (36) = happyGoto action_141
action_148 (37) = happyGoto action_57
action_148 (38) = happyGoto action_58
action_148 (39) = happyGoto action_59
action_148 _ = happyReduce_29

action_149 (40) = happyShift action_60
action_149 (45) = happyShift action_61
action_149 (47) = happyShift action_62
action_149 (49) = happyShift action_63
action_149 (53) = happyShift action_64
action_149 (82) = happyShift action_65
action_149 (90) = happyShift action_2
action_149 (91) = happyShift action_66
action_149 (92) = happyShift action_67
action_149 (93) = happyShift action_68
action_149 (94) = happyShift action_19
action_149 (4) = happyGoto action_38
action_149 (5) = happyGoto action_39
action_149 (6) = happyGoto action_40
action_149 (7) = happyGoto action_41
action_149 (8) = happyGoto action_3
action_149 (16) = happyGoto action_42
action_149 (17) = happyGoto action_43
action_149 (18) = happyGoto action_44
action_149 (19) = happyGoto action_45
action_149 (20) = happyGoto action_46
action_149 (21) = happyGoto action_47
action_149 (22) = happyGoto action_48
action_149 (23) = happyGoto action_49
action_149 (24) = happyGoto action_50
action_149 (25) = happyGoto action_51
action_149 (26) = happyGoto action_52
action_149 (27) = happyGoto action_53
action_149 (28) = happyGoto action_154
action_149 (29) = happyGoto action_54
action_149 (30) = happyGoto action_55
action_149 (31) = happyGoto action_8
action_149 (36) = happyGoto action_132
action_149 (37) = happyGoto action_57
action_149 (38) = happyGoto action_58
action_149 (39) = happyGoto action_59
action_149 _ = happyReduce_78

action_150 _ = happyReduce_68

action_151 _ = happyReduce_67

action_152 (40) = happyShift action_60
action_152 (45) = happyShift action_61
action_152 (47) = happyShift action_62
action_152 (49) = happyShift action_63
action_152 (53) = happyShift action_64
action_152 (90) = happyShift action_2
action_152 (91) = happyShift action_66
action_152 (92) = happyShift action_67
action_152 (93) = happyShift action_68
action_152 (94) = happyShift action_19
action_152 (4) = happyGoto action_38
action_152 (5) = happyGoto action_39
action_152 (6) = happyGoto action_40
action_152 (7) = happyGoto action_41
action_152 (8) = happyGoto action_3
action_152 (17) = happyGoto action_153
action_152 (18) = happyGoto action_44
action_152 (19) = happyGoto action_45
action_152 (20) = happyGoto action_46
action_152 (21) = happyGoto action_47
action_152 (22) = happyGoto action_48
action_152 (23) = happyGoto action_49
action_152 (24) = happyGoto action_50
action_152 (25) = happyGoto action_51
action_152 (26) = happyGoto action_52
action_152 (27) = happyGoto action_53
action_152 (29) = happyGoto action_54
action_152 (30) = happyGoto action_55
action_152 (31) = happyGoto action_8
action_152 (37) = happyGoto action_57
action_152 (38) = happyGoto action_58
action_152 (39) = happyGoto action_59
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_36

action_154 _ = happyReduce_80

action_155 (89) = happyShift action_172
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (40) = happyShift action_60
action_156 (45) = happyShift action_61
action_156 (47) = happyShift action_62
action_156 (49) = happyShift action_63
action_156 (53) = happyShift action_64
action_156 (82) = happyShift action_65
action_156 (90) = happyShift action_2
action_156 (91) = happyShift action_66
action_156 (92) = happyShift action_67
action_156 (93) = happyShift action_68
action_156 (94) = happyShift action_19
action_156 (4) = happyGoto action_38
action_156 (5) = happyGoto action_39
action_156 (6) = happyGoto action_40
action_156 (7) = happyGoto action_41
action_156 (8) = happyGoto action_3
action_156 (16) = happyGoto action_42
action_156 (17) = happyGoto action_43
action_156 (18) = happyGoto action_44
action_156 (19) = happyGoto action_45
action_156 (20) = happyGoto action_46
action_156 (21) = happyGoto action_47
action_156 (22) = happyGoto action_48
action_156 (23) = happyGoto action_49
action_156 (24) = happyGoto action_50
action_156 (25) = happyGoto action_51
action_156 (26) = happyGoto action_52
action_156 (27) = happyGoto action_53
action_156 (29) = happyGoto action_54
action_156 (30) = happyGoto action_55
action_156 (31) = happyGoto action_8
action_156 (36) = happyGoto action_171
action_156 (37) = happyGoto action_57
action_156 (38) = happyGoto action_58
action_156 (39) = happyGoto action_59
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (94) = happyShift action_19
action_157 (8) = happyGoto action_170
action_157 _ = happyFail (happyExpListPerState 157)

action_158 _ = happyReduce_21

action_159 (40) = happyShift action_60
action_159 (45) = happyShift action_61
action_159 (47) = happyShift action_62
action_159 (49) = happyShift action_63
action_159 (53) = happyShift action_64
action_159 (82) = happyShift action_65
action_159 (90) = happyShift action_2
action_159 (91) = happyShift action_66
action_159 (92) = happyShift action_67
action_159 (93) = happyShift action_68
action_159 (94) = happyShift action_19
action_159 (4) = happyGoto action_38
action_159 (5) = happyGoto action_39
action_159 (6) = happyGoto action_40
action_159 (7) = happyGoto action_41
action_159 (8) = happyGoto action_3
action_159 (16) = happyGoto action_42
action_159 (17) = happyGoto action_43
action_159 (18) = happyGoto action_44
action_159 (19) = happyGoto action_45
action_159 (20) = happyGoto action_46
action_159 (21) = happyGoto action_47
action_159 (22) = happyGoto action_48
action_159 (23) = happyGoto action_49
action_159 (24) = happyGoto action_50
action_159 (25) = happyGoto action_51
action_159 (26) = happyGoto action_52
action_159 (27) = happyGoto action_53
action_159 (29) = happyGoto action_54
action_159 (30) = happyGoto action_55
action_159 (31) = happyGoto action_8
action_159 (36) = happyGoto action_169
action_159 (37) = happyGoto action_57
action_159 (38) = happyGoto action_58
action_159 (39) = happyGoto action_59
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (72) = happyShift action_11
action_160 (73) = happyShift action_12
action_160 (74) = happyShift action_13
action_160 (76) = happyShift action_14
action_160 (80) = happyShift action_15
action_160 (85) = happyShift action_18
action_160 (94) = happyShift action_19
action_160 (8) = happyGoto action_3
action_160 (30) = happyGoto action_7
action_160 (31) = happyGoto action_8
action_160 (32) = happyGoto action_9
action_160 (33) = happyGoto action_168
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (86) = happyShift action_167
action_161 _ = happyFail (happyExpListPerState 161)

action_162 _ = happyReduce_20

action_163 (60) = happyShift action_166
action_163 _ = happyFail (happyExpListPerState 163)

action_164 _ = happyReduce_9

action_165 _ = happyReduce_30

action_166 _ = happyReduce_19

action_167 (45) = happyShift action_177
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (94) = happyShift action_19
action_168 (8) = happyGoto action_72
action_168 (34) = happyGoto action_176
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (46) = happyShift action_175
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (60) = happyShift action_174
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (46) = happyShift action_173
action_171 _ = happyFail (happyExpListPerState 171)

action_172 _ = happyReduce_25

action_173 (40) = happyShift action_60
action_173 (45) = happyShift action_61
action_173 (47) = happyShift action_62
action_173 (49) = happyShift action_63
action_173 (53) = happyShift action_64
action_173 (72) = happyShift action_11
action_173 (73) = happyShift action_12
action_173 (74) = happyShift action_13
action_173 (75) = happyShift action_142
action_173 (76) = happyShift action_14
action_173 (78) = happyShift action_143
action_173 (79) = happyShift action_144
action_173 (80) = happyShift action_15
action_173 (81) = happyShift action_145
action_173 (82) = happyShift action_65
action_173 (83) = happyShift action_146
action_173 (85) = happyShift action_18
action_173 (86) = happyShift action_147
action_173 (87) = happyShift action_148
action_173 (90) = happyShift action_2
action_173 (91) = happyShift action_66
action_173 (92) = happyShift action_67
action_173 (93) = happyShift action_68
action_173 (94) = happyShift action_19
action_173 (4) = happyGoto action_38
action_173 (5) = happyGoto action_39
action_173 (6) = happyGoto action_40
action_173 (7) = happyGoto action_41
action_173 (8) = happyGoto action_3
action_173 (14) = happyGoto action_181
action_173 (16) = happyGoto action_42
action_173 (17) = happyGoto action_43
action_173 (18) = happyGoto action_44
action_173 (19) = happyGoto action_45
action_173 (20) = happyGoto action_46
action_173 (21) = happyGoto action_47
action_173 (22) = happyGoto action_48
action_173 (23) = happyGoto action_49
action_173 (24) = happyGoto action_50
action_173 (25) = happyGoto action_51
action_173 (26) = happyGoto action_52
action_173 (27) = happyGoto action_53
action_173 (29) = happyGoto action_54
action_173 (30) = happyGoto action_139
action_173 (31) = happyGoto action_8
action_173 (32) = happyGoto action_9
action_173 (33) = happyGoto action_140
action_173 (36) = happyGoto action_141
action_173 (37) = happyGoto action_57
action_173 (38) = happyGoto action_58
action_173 (39) = happyGoto action_59
action_173 _ = happyFail (happyExpListPerState 173)

action_174 _ = happyReduce_26

action_175 (40) = happyShift action_60
action_175 (45) = happyShift action_61
action_175 (47) = happyShift action_62
action_175 (49) = happyShift action_63
action_175 (53) = happyShift action_64
action_175 (72) = happyShift action_11
action_175 (73) = happyShift action_12
action_175 (74) = happyShift action_13
action_175 (75) = happyShift action_142
action_175 (76) = happyShift action_14
action_175 (78) = happyShift action_143
action_175 (79) = happyShift action_144
action_175 (80) = happyShift action_15
action_175 (81) = happyShift action_145
action_175 (82) = happyShift action_65
action_175 (83) = happyShift action_146
action_175 (85) = happyShift action_18
action_175 (86) = happyShift action_147
action_175 (87) = happyShift action_148
action_175 (90) = happyShift action_2
action_175 (91) = happyShift action_66
action_175 (92) = happyShift action_67
action_175 (93) = happyShift action_68
action_175 (94) = happyShift action_19
action_175 (4) = happyGoto action_38
action_175 (5) = happyGoto action_39
action_175 (6) = happyGoto action_40
action_175 (7) = happyGoto action_41
action_175 (8) = happyGoto action_3
action_175 (14) = happyGoto action_180
action_175 (16) = happyGoto action_42
action_175 (17) = happyGoto action_43
action_175 (18) = happyGoto action_44
action_175 (19) = happyGoto action_45
action_175 (20) = happyGoto action_46
action_175 (21) = happyGoto action_47
action_175 (22) = happyGoto action_48
action_175 (23) = happyGoto action_49
action_175 (24) = happyGoto action_50
action_175 (25) = happyGoto action_51
action_175 (26) = happyGoto action_52
action_175 (27) = happyGoto action_53
action_175 (29) = happyGoto action_54
action_175 (30) = happyGoto action_139
action_175 (31) = happyGoto action_8
action_175 (32) = happyGoto action_9
action_175 (33) = happyGoto action_140
action_175 (36) = happyGoto action_141
action_175 (37) = happyGoto action_57
action_175 (38) = happyGoto action_58
action_175 (39) = happyGoto action_59
action_175 _ = happyFail (happyExpListPerState 175)

action_176 (60) = happyShift action_179
action_176 _ = happyFail (happyExpListPerState 176)

action_177 (40) = happyShift action_60
action_177 (45) = happyShift action_61
action_177 (47) = happyShift action_62
action_177 (49) = happyShift action_63
action_177 (53) = happyShift action_64
action_177 (82) = happyShift action_65
action_177 (90) = happyShift action_2
action_177 (91) = happyShift action_66
action_177 (92) = happyShift action_67
action_177 (93) = happyShift action_68
action_177 (94) = happyShift action_19
action_177 (4) = happyGoto action_38
action_177 (5) = happyGoto action_39
action_177 (6) = happyGoto action_40
action_177 (7) = happyGoto action_41
action_177 (8) = happyGoto action_3
action_177 (16) = happyGoto action_42
action_177 (17) = happyGoto action_43
action_177 (18) = happyGoto action_44
action_177 (19) = happyGoto action_45
action_177 (20) = happyGoto action_46
action_177 (21) = happyGoto action_47
action_177 (22) = happyGoto action_48
action_177 (23) = happyGoto action_49
action_177 (24) = happyGoto action_50
action_177 (25) = happyGoto action_51
action_177 (26) = happyGoto action_52
action_177 (27) = happyGoto action_53
action_177 (29) = happyGoto action_54
action_177 (30) = happyGoto action_55
action_177 (31) = happyGoto action_8
action_177 (36) = happyGoto action_178
action_177 (37) = happyGoto action_57
action_177 (38) = happyGoto action_58
action_177 (39) = happyGoto action_59
action_177 _ = happyFail (happyExpListPerState 177)

action_178 (46) = happyShift action_184
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (40) = happyShift action_60
action_179 (45) = happyShift action_61
action_179 (47) = happyShift action_62
action_179 (49) = happyShift action_63
action_179 (53) = happyShift action_64
action_179 (82) = happyShift action_65
action_179 (90) = happyShift action_2
action_179 (91) = happyShift action_66
action_179 (92) = happyShift action_67
action_179 (93) = happyShift action_68
action_179 (94) = happyShift action_19
action_179 (4) = happyGoto action_38
action_179 (5) = happyGoto action_39
action_179 (6) = happyGoto action_40
action_179 (7) = happyGoto action_41
action_179 (8) = happyGoto action_3
action_179 (16) = happyGoto action_42
action_179 (17) = happyGoto action_43
action_179 (18) = happyGoto action_44
action_179 (19) = happyGoto action_45
action_179 (20) = happyGoto action_46
action_179 (21) = happyGoto action_47
action_179 (22) = happyGoto action_48
action_179 (23) = happyGoto action_49
action_179 (24) = happyGoto action_50
action_179 (25) = happyGoto action_51
action_179 (26) = happyGoto action_52
action_179 (27) = happyGoto action_53
action_179 (29) = happyGoto action_54
action_179 (30) = happyGoto action_55
action_179 (31) = happyGoto action_8
action_179 (36) = happyGoto action_183
action_179 (37) = happyGoto action_57
action_179 (38) = happyGoto action_58
action_179 (39) = happyGoto action_59
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (77) = happyShift action_182
action_180 _ = happyReduce_27

action_181 _ = happyReduce_22

action_182 (40) = happyShift action_60
action_182 (45) = happyShift action_61
action_182 (47) = happyShift action_62
action_182 (49) = happyShift action_63
action_182 (53) = happyShift action_64
action_182 (72) = happyShift action_11
action_182 (73) = happyShift action_12
action_182 (74) = happyShift action_13
action_182 (75) = happyShift action_142
action_182 (76) = happyShift action_14
action_182 (78) = happyShift action_143
action_182 (79) = happyShift action_144
action_182 (80) = happyShift action_15
action_182 (81) = happyShift action_145
action_182 (82) = happyShift action_65
action_182 (83) = happyShift action_146
action_182 (85) = happyShift action_18
action_182 (86) = happyShift action_147
action_182 (87) = happyShift action_148
action_182 (90) = happyShift action_2
action_182 (91) = happyShift action_66
action_182 (92) = happyShift action_67
action_182 (93) = happyShift action_68
action_182 (94) = happyShift action_19
action_182 (4) = happyGoto action_38
action_182 (5) = happyGoto action_39
action_182 (6) = happyGoto action_40
action_182 (7) = happyGoto action_41
action_182 (8) = happyGoto action_3
action_182 (14) = happyGoto action_187
action_182 (16) = happyGoto action_42
action_182 (17) = happyGoto action_43
action_182 (18) = happyGoto action_44
action_182 (19) = happyGoto action_45
action_182 (20) = happyGoto action_46
action_182 (21) = happyGoto action_47
action_182 (22) = happyGoto action_48
action_182 (23) = happyGoto action_49
action_182 (24) = happyGoto action_50
action_182 (25) = happyGoto action_51
action_182 (26) = happyGoto action_52
action_182 (27) = happyGoto action_53
action_182 (29) = happyGoto action_54
action_182 (30) = happyGoto action_139
action_182 (31) = happyGoto action_8
action_182 (32) = happyGoto action_9
action_182 (33) = happyGoto action_140
action_182 (36) = happyGoto action_141
action_182 (37) = happyGoto action_57
action_182 (38) = happyGoto action_58
action_182 (39) = happyGoto action_59
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (60) = happyShift action_186
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (60) = happyShift action_185
action_184 _ = happyFail (happyExpListPerState 184)

action_185 _ = happyReduce_24

action_186 (40) = happyShift action_60
action_186 (45) = happyShift action_61
action_186 (47) = happyShift action_62
action_186 (49) = happyShift action_63
action_186 (53) = happyShift action_64
action_186 (82) = happyShift action_65
action_186 (90) = happyShift action_2
action_186 (91) = happyShift action_66
action_186 (92) = happyShift action_67
action_186 (93) = happyShift action_68
action_186 (94) = happyShift action_19
action_186 (4) = happyGoto action_38
action_186 (5) = happyGoto action_39
action_186 (6) = happyGoto action_40
action_186 (7) = happyGoto action_41
action_186 (8) = happyGoto action_3
action_186 (16) = happyGoto action_42
action_186 (17) = happyGoto action_43
action_186 (18) = happyGoto action_44
action_186 (19) = happyGoto action_45
action_186 (20) = happyGoto action_46
action_186 (21) = happyGoto action_47
action_186 (22) = happyGoto action_48
action_186 (23) = happyGoto action_49
action_186 (24) = happyGoto action_50
action_186 (25) = happyGoto action_51
action_186 (26) = happyGoto action_52
action_186 (27) = happyGoto action_53
action_186 (29) = happyGoto action_54
action_186 (30) = happyGoto action_55
action_186 (31) = happyGoto action_8
action_186 (36) = happyGoto action_188
action_186 (37) = happyGoto action_57
action_186 (38) = happyGoto action_58
action_186 (39) = happyGoto action_59
action_186 _ = happyFail (happyExpListPerState 186)

action_187 _ = happyReduce_28

action_188 (46) = happyShift action_189
action_188 _ = happyFail (happyExpListPerState 188)

action_189 (40) = happyShift action_60
action_189 (45) = happyShift action_61
action_189 (47) = happyShift action_62
action_189 (49) = happyShift action_63
action_189 (53) = happyShift action_64
action_189 (72) = happyShift action_11
action_189 (73) = happyShift action_12
action_189 (74) = happyShift action_13
action_189 (75) = happyShift action_142
action_189 (76) = happyShift action_14
action_189 (78) = happyShift action_143
action_189 (79) = happyShift action_144
action_189 (80) = happyShift action_15
action_189 (81) = happyShift action_145
action_189 (82) = happyShift action_65
action_189 (83) = happyShift action_146
action_189 (85) = happyShift action_18
action_189 (86) = happyShift action_147
action_189 (87) = happyShift action_148
action_189 (90) = happyShift action_2
action_189 (91) = happyShift action_66
action_189 (92) = happyShift action_67
action_189 (93) = happyShift action_68
action_189 (94) = happyShift action_19
action_189 (4) = happyGoto action_38
action_189 (5) = happyGoto action_39
action_189 (6) = happyGoto action_40
action_189 (7) = happyGoto action_41
action_189 (8) = happyGoto action_3
action_189 (14) = happyGoto action_190
action_189 (16) = happyGoto action_42
action_189 (17) = happyGoto action_43
action_189 (18) = happyGoto action_44
action_189 (19) = happyGoto action_45
action_189 (20) = happyGoto action_46
action_189 (21) = happyGoto action_47
action_189 (22) = happyGoto action_48
action_189 (23) = happyGoto action_49
action_189 (24) = happyGoto action_50
action_189 (25) = happyGoto action_51
action_189 (26) = happyGoto action_52
action_189 (27) = happyGoto action_53
action_189 (29) = happyGoto action_54
action_189 (30) = happyGoto action_139
action_189 (31) = happyGoto action_8
action_189 (32) = happyGoto action_9
action_189 (33) = happyGoto action_140
action_189 (36) = happyGoto action_141
action_189 (37) = happyGoto action_57
action_189 (38) = happyGoto action_58
action_189 (39) = happyGoto action_59
action_189 _ = happyFail (happyExpListPerState 189)

action_190 _ = happyReduce_23

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (PT _ (TC happy_var_1)))
	 =  HappyAbsSyn4
		 ((read happy_var_1) :: Char
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyTerminal (PT _ (TD happy_var_1)))
	 =  HappyAbsSyn5
		 ((read happy_var_1) :: Double
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn6
		 ((read happy_var_1) :: Integer
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  8 happyReduction_5
happyReduction_5 (HappyTerminal (PT _ (T_Id happy_var_1)))
	 =  HappyAbsSyn8
		 (Calc.Abs.Id happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  9 happyReduction_6
happyReduction_6 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (Calc.Abs.ProgDef happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  10 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Calc.Abs.QualConstDef happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  10 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn35  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn10
		 (Calc.Abs.StmDef happy_var_1 happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 8 10 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	(HappyAbsSyn33  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Calc.Abs.FuncDef happy_var_1 happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 10 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	(HappyAbsSyn33  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Calc.Abs.FuncDef2 happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 10 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Calc.Abs.TypeDef happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_0  11 happyReduction_12
happyReduction_12  =  HappyAbsSyn11
		 ([]
	)

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_0  12 happyReduction_14
happyReduction_14  =  HappyAbsSyn12
		 ([]
	)

happyReduce_15 = happySpecReduce_1  12 happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ((:[]) happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  12 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  13 happyReduction_17
happyReduction_17 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc.Abs.ArgDecl2 happy_var_1 happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc.Abs.ArgDecl3 happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  14 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn35  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn14
		 (Calc.Abs.InitStm happy_var_1 happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  14 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (Calc.Abs.StmExp happy_var_1
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  14 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Calc.Abs.ReturnStm happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 5 14 happyReduction_22
happyReduction_22 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.WhileStm happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 10 14 happyReduction_23
happyReduction_23 ((HappyAbsSyn14  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_4) `HappyStk`
	(HappyAbsSyn33  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.ForStm happy_var_3 happy_var_4 happy_var_6 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 7 14 happyReduction_24
happyReduction_24 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.DoWhileStm happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Calc.Abs.BlockStm happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 4 14 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn33  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.TypeDefStm happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 5 14 happyReduction_27
happyReduction_27 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.IfStm happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 7 14 happyReduction_28
happyReduction_28 ((HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Calc.Abs.IfElseStm happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_0  15 happyReduction_29
happyReduction_29  =  HappyAbsSyn15
		 ([]
	)

happyReduce_30 = happySpecReduce_2  15 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  16 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Calc.Abs.ThrowExcep happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  17 happyReduction_33
happyReduction_33 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.AssignExp happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.PlusAssigExp happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  17 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.MinusAssigExp happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 5 17 happyReduction_36
happyReduction_36 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Calc.Abs.CondExp happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  18 happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.DisjExp happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  18 happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  19 happyReduction_40
happyReduction_40 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.ConjExp happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  19 happyReduction_41
happyReduction_41 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  20 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.EqExp happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  20 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.InEqExp happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  21 happyReduction_45
happyReduction_45 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.LessExp happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  21 happyReduction_46
happyReduction_46 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.LeqExp happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  21 happyReduction_47
happyReduction_47 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.GeqExp happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  21 happyReduction_48
happyReduction_48 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.GreaterExp happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  21 happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  22 happyReduction_50
happyReduction_50 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.LShift happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  22 happyReduction_51
happyReduction_51 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.RShift happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  22 happyReduction_52
happyReduction_52 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  23 happyReduction_53
happyReduction_53 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.AddExp happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  23 happyReduction_54
happyReduction_54 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.MinExp happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  24 happyReduction_56
happyReduction_56 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.MulExp happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  24 happyReduction_57
happyReduction_57 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.DivExp happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  24 happyReduction_58
happyReduction_58 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.ModExp happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  24 happyReduction_59
happyReduction_59 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  25 happyReduction_60
happyReduction_60 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Calc.Abs.Incr2Exp happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_2  25 happyReduction_61
happyReduction_61 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Calc.Abs.Decr2Exp happy_var_2
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  25 happyReduction_62
happyReduction_62 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Calc.Abs.NegExp happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  25 happyReduction_63
happyReduction_63 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Calc.Abs.DeRefExp happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  25 happyReduction_64
happyReduction_64 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  26 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.Incr1Exp happy_var_1
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  26 happyReduction_66
happyReduction_66 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.Decr1Exp happy_var_1
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happyReduce 4 26 happyReduction_67
happyReduction_67 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Calc.Abs.IndexExp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_68 = happyReduce 4 26 happyReduction_68
happyReduction_68 (_ `HappyStk`
	(HappyAbsSyn28  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Calc.Abs.FunCallExp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_69 = happySpecReduce_3  26 happyReduction_69
happyReduction_69 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.DotStrucProjExp happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  26 happyReduction_70
happyReduction_70 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.ArrStrucProjExp happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  26 happyReduction_71
happyReduction_71 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  27 happyReduction_72
happyReduction_72 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.IntExp happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  27 happyReduction_73
happyReduction_73 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.DoubleExp happy_var_1
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  27 happyReduction_74
happyReduction_74 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.StringArrExp happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  27 happyReduction_75
happyReduction_75 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.CharExp happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  27 happyReduction_76
happyReduction_76 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn16
		 (Calc.Abs.QualConstExp happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  27 happyReduction_77
happyReduction_77 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_0  28 happyReduction_78
happyReduction_78  =  HappyAbsSyn28
		 ([]
	)

happyReduce_79 = happySpecReduce_1  28 happyReduction_79
happyReduction_79 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn28
		 ((:[]) happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  28 happyReduction_80
happyReduction_80 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn28
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  29 happyReduction_81
happyReduction_81 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn29
		 ((:[]) happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_2  29 happyReduction_82
happyReduction_82 (HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_82 _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_1  30 happyReduction_83
happyReduction_83 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Calc.Abs.QualConstDecls happy_var_1
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_1  31 happyReduction_84
happyReduction_84 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn31
		 ((:[]) happy_var_1
	)
happyReduction_84 _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  31 happyReduction_85
happyReduction_85 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn31
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_1  32 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn32
		 (Calc.Abs.CharType
	)

happyReduce_87 = happySpecReduce_1  32 happyReduction_87
happyReduction_87 _
	 =  HappyAbsSyn32
		 (Calc.Abs.BoolType
	)

happyReduce_88 = happySpecReduce_1  32 happyReduction_88
happyReduction_88 _
	 =  HappyAbsSyn32
		 (Calc.Abs.DoubleType
	)

happyReduce_89 = happySpecReduce_1  32 happyReduction_89
happyReduction_89 _
	 =  HappyAbsSyn32
		 (Calc.Abs.IntType
	)

happyReduce_90 = happySpecReduce_1  32 happyReduction_90
happyReduction_90 _
	 =  HappyAbsSyn32
		 (Calc.Abs.VoidType
	)

happyReduce_91 = happySpecReduce_1  32 happyReduction_91
happyReduction_91 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn32
		 (Calc.Abs.QualConstType happy_var_1
	)
happyReduction_91 _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_1  33 happyReduction_92
happyReduction_92 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn33
		 (Calc.Abs.GenTypeDecl happy_var_1
	)
happyReduction_92 _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_2  33 happyReduction_93
happyReduction_93 (HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (Calc.Abs.ConstGenType happy_var_2
	)
happyReduction_93 _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_2  33 happyReduction_94
happyReduction_94 _
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn33
		 (Calc.Abs.AndGenType happy_var_1
	)
happyReduction_94 _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  33 happyReduction_95
happyReduction_95 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (Calc.Abs.CAndGenType happy_var_2
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_1  34 happyReduction_96
happyReduction_96 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn34
		 (Calc.Abs.InitDecl happy_var_1
	)
happyReduction_96 _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  34 happyReduction_97
happyReduction_97 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn34
		 (Calc.Abs.InitAssign happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_1  35 happyReduction_98
happyReduction_98 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn35
		 ((:[]) happy_var_1
	)
happyReduction_98 _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  35 happyReduction_99
happyReduction_99 (HappyAbsSyn35  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn35
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_1  36 happyReduction_100
happyReduction_100 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_100 _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_1  37 happyReduction_101
happyReduction_101 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_101 _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_1  38 happyReduction_102
happyReduction_102 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_102 _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_1  39 happyReduction_103
happyReduction_103 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_103 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 95 95 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 40;
	PT _ (TS _ 2) -> cont 41;
	PT _ (TS _ 3) -> cont 42;
	PT _ (TS _ 4) -> cont 43;
	PT _ (TS _ 5) -> cont 44;
	PT _ (TS _ 6) -> cont 45;
	PT _ (TS _ 7) -> cont 46;
	PT _ (TS _ 8) -> cont 47;
	PT _ (TS _ 9) -> cont 48;
	PT _ (TS _ 10) -> cont 49;
	PT _ (TS _ 11) -> cont 50;
	PT _ (TS _ 12) -> cont 51;
	PT _ (TS _ 13) -> cont 52;
	PT _ (TS _ 14) -> cont 53;
	PT _ (TS _ 15) -> cont 54;
	PT _ (TS _ 16) -> cont 55;
	PT _ (TS _ 17) -> cont 56;
	PT _ (TS _ 18) -> cont 57;
	PT _ (TS _ 19) -> cont 58;
	PT _ (TS _ 20) -> cont 59;
	PT _ (TS _ 21) -> cont 60;
	PT _ (TS _ 22) -> cont 61;
	PT _ (TS _ 23) -> cont 62;
	PT _ (TS _ 24) -> cont 63;
	PT _ (TS _ 25) -> cont 64;
	PT _ (TS _ 26) -> cont 65;
	PT _ (TS _ 27) -> cont 66;
	PT _ (TS _ 28) -> cont 67;
	PT _ (TS _ 29) -> cont 68;
	PT _ (TS _ 30) -> cont 69;
	PT _ (TS _ 31) -> cont 70;
	PT _ (TS _ 32) -> cont 71;
	PT _ (TS _ 33) -> cont 72;
	PT _ (TS _ 34) -> cont 73;
	PT _ (TS _ 35) -> cont 74;
	PT _ (TS _ 36) -> cont 75;
	PT _ (TS _ 37) -> cont 76;
	PT _ (TS _ 38) -> cont 77;
	PT _ (TS _ 39) -> cont 78;
	PT _ (TS _ 40) -> cont 79;
	PT _ (TS _ 41) -> cont 80;
	PT _ (TS _ 42) -> cont 81;
	PT _ (TS _ 43) -> cont 82;
	PT _ (TS _ 44) -> cont 83;
	PT _ (TS _ 45) -> cont 84;
	PT _ (TS _ 46) -> cont 85;
	PT _ (TS _ 47) -> cont 86;
	PT _ (TS _ 48) -> cont 87;
	PT _ (TS _ 49) -> cont 88;
	PT _ (TS _ 50) -> cont 89;
	PT _ (TC happy_dollar_dollar) -> cont 90;
	PT _ (TD happy_dollar_dollar) -> cont 91;
	PT _ (TI happy_dollar_dollar) -> cont 92;
	PT _ (TL happy_dollar_dollar) -> cont 93;
	PT _ (T_Id happy_dollar_dollar) -> cont 94;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 95 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

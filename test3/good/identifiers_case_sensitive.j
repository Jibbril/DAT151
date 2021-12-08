.class public identifiers_case_sensitive
.super java/lang/Object

.method public <init>()V
  .limit locals 1

  aload_0
  invokespecial java/lang/Object/<init>()V
  return

.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 1
  .limit stack  1

  invokestatic identifiers_case_sensitive/main()I
  pop
  return

.end method


.method public static printint(I)V
  .limit locals 1
  .limit stack 2

	
        ;; void printInt (100 + x);
	bipush 100
	iload_0
	iadd
	invokestatic Runtime/printInt(I)V
	nop
        iconst_0
        return

.end method

.method public static printdouble(D)V
  .limit locals 2
  .limit stack 4

	
        ;; void printDouble (99.0000000000000 + x);
	ldc2_w 99.0
	dload_0
	iadd
	invokestatic Runtime/printDouble(D)V
	nop
        iconst_0
        return

.end method

.method public static readint()I
  .limit locals 0
  .limit stack 1

	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.method public static readdouble()D
  .limit locals 0
  .limit stack 2

	
        ;; return double 1.00000000000000;
	dconst_1
	dreturn

.end method

.method public static main()I
  .limit locals 3
  .limit stack 2

	
        ;; int x = int readint ();
	invokestatic identifiers_case_sensitive/readint()I
	istore_0
	
        ;; double X = double readdouble ();
	invokestatic identifiers_case_sensitive/readdouble()D
	dstore_1
	
        ;; void printint (x);
	iload_0
	invokestatic identifiers_case_sensitive/printint(I)V
	nop
	
        ;; void printdouble (X);
	dload_1
	invokestatic identifiers_case_sensitive/printdouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

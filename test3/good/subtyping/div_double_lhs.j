.class public div_double_lhs
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

  invokestatic div_double_lhs/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 4

	
        ;; void printDouble (double (double 1.00000000000000) / (double 2.00000000000000));
	dconst_1
	ldc2_w 2.0
	ddiv
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

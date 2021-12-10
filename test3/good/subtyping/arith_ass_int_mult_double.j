.class public arith_ass_int_mult_double
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

  invokestatic arith_ass_int_mult_double/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 3

	
        ;; double x = double (int 2) * (double 3.14000000000000);
	iconst_2
	ldc2_w 3.14
	dmul
	dstore_0
	dload_0
	pop2
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

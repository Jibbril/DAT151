.class public arith_double_sub_int
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

  invokestatic arith_double_sub_int/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 4

	
        ;; double x = double (double 1.10000000000000) - (int 1);
	ldc2_w 1.1
	iconst_1
	i2d
	dsub
	dstore_0
	dload_0
	pop2
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

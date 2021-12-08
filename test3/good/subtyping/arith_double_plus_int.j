.class public arith_double_plus_int
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

  invokestatic arith_double_plus_int/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 2
.limit stack 1
	dstore_0
	
        ;; double x = double 1.10000000000000 + 1;
	ldc2_w 1.1
	iconst_1
	iadd
	dstore_0
	dload_0
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

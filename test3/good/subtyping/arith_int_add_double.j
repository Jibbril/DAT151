.class public arith_int_add_double
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

  invokestatic arith_int_add_double/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 2
.limit stack 1
	dstore_0
	
        ;; double x = double 1 + 1.10000000000000;
	iconst_1
	ldc2_w 1.1
	iadd
	dstore_0
	dload_0
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

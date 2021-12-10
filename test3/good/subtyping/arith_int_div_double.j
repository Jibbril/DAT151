.class public arith_int_div_double
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

  invokestatic arith_int_div_double/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 3

	
        ;; double x = double (int 1) / (double 1.10000000000000);
	iconst_1
	ldc2_w 1.1
	ddiv
	dstore_0
	dload_0
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

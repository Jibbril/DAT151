.class public int_fun2
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

  invokestatic int_fun2/main()I
  pop
  return

.end method


.method public static have_an_int(DD)D
  .limit locals 4
  .limit stack 4

	
        ;; return double (double arg0) / (double arg1);
	dload_0
	dload_2
	ddiv
	dreturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 4

	
        ;; void printDouble (double have_an_int (double 1.00000000000000, double 2.00000000000000));
	dconst_1
	ldc2_w 2.0
	invokestatic int_fun2/have_an_int(DD)D
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

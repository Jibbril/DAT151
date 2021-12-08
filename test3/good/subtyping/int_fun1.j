.class public int_fun1
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

  invokestatic int_fun1/main()I
  pop
  return

.end method


.method public static have_an_int(D)D
  .limit locals 2
  .limit stack 3

	
        ;; return double arg / 2;
	dload_0
	iconst_2
	idiv
	dreturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printDouble (have_an_int (1));
	iconst_1
	invokestatic int_fun1/have_an_int(D)D
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

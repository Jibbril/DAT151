.class public int_fun0
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

  invokestatic int_fun0/main()I
  pop
  return

.end method


.method public static have_an_int()D
  .limit locals 0
  .limit stack 1

	
        ;; return double 1;
	iconst_1
	dreturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 3

	
        ;; void printDouble (have_an_int () / 2);
	invokestatic int_fun0/have_an_int()D
	iconst_2
	idiv
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method
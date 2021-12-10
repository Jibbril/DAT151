.class public mixed
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

  invokestatic mixed/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 4

	
        ;; void printDouble (double (double 1.50000000000000) + (int (int 1) / (int 2)));
	ldc2_w 1.5
	iconst_1
	iconst_2
	idiv
	dadd
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public dummy
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

  invokestatic dummy/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 2

	
        ;; int x = int (int 1) / (int 2);
	iconst_1
	iconst_2
	idiv
	istore_0
	
        ;; void printDouble (int x);
	iload_0
	i2d
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

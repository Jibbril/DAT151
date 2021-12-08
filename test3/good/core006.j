.class public core006
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

  invokestatic core006/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; int x = int 45;
	bipush 45
	istore_0
	iload_0
	pop
	
        ;; int y = int 36 + 67;
	bipush 36
	bipush 67
	iadd
	istore_1
	iload_1
	pop
	
        ;; void printInt (x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (y);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

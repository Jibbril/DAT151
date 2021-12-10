.class public good17
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

  invokestatic good17/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 3
  .limit stack 2

	
        ;; int x = int 6;
	bipush 6
	istore_0
	iload_0
	pop
	
        ;; int y = int (int x) + (int 7);
	iload_0
	bipush 7
	iadd
	istore_1
	iload_1
	pop
	
        ;; void printInt (int y);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int y = int 4;
	iconst_4
	istore_2
	iload_2
	pop
	
        ;; void printInt (int y);
	iload_2
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int x = int y;
	iload_2
	istore_0
	iload_0
	pop
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int y);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

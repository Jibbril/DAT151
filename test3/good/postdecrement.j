.class public postdecrement
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

  invokestatic postdecrement/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 3

	
        ;; int j = int 22;
	bipush 22
	istore_0
	
        ;; int k = int 23;
	bipush 23
	istore_1
	
        ;; int j --;
	iload_0
	dup
	iconst_1
	isub
	istore_0
	pop
	
        ;; void printInt (int j);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int k --);
	iload_1
	dup
	iconst_1
	isub
	istore_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public good09
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

  invokestatic good09/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 3

	
        ;; int i = int readInt ();
	invokestatic Runtime/readInt()I
	istore_0
	
        ;; void printInt (i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (i ++);
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (++ i);
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

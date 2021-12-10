.class public ass_in_block
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

  invokestatic ass_in_block/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; int x = int 5;
	iconst_5
	istore_0
	
        ;; int x = int 7;
	bipush 7
	istore_0
	iload_0
	pop
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

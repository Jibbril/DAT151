.class public return_in_block_block
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

  invokestatic return_in_block_block/main()I
  pop
  return

.end method


.method public static niam()I
  .limit locals 0
  .limit stack 1

	
        ;; return int 99;
	bipush 99
	ireturn
	
        ;; void printInt (int 2);
	iconst_2
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
        return

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int niam ());
	invokestatic return_in_block_block/niam()I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn
	
        ;; void printInt (int 3);
	iconst_3
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int 4);
	iconst_4
	invokestatic Runtime/printInt(I)V
	nop
        return

.end method

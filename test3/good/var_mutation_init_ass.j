.class public var_mutation_init_ass
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

  invokestatic var_mutation_init_ass/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 3

	
        ;; int b = int a = int 0;
	iconst_0
	istore_0
	iload_0
	istore_1
	
        ;; int ++ b;
	iload_1
	iconst_1
	iadd
	istore_1
	iload_1
	pop
	
        ;; void printInt (int a);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int b ++;
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	pop
	
        ;; void printInt (int a);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int -- b;
	iload_1
	iconst_1
	isub
	istore_1
	iload_1
	pop
	
        ;; void printInt (int a);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int b --;
	iload_1
	dup
	iconst_1
	isub
	istore_1
	pop
	
        ;; void printInt (int a);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int b = int 832;
	ldc 832
	istore_1
	iload_1
	pop
	
        ;; void printInt (int a);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

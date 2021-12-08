.class public var_mutation_init_id
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

  invokestatic var_mutation_init_id/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 2
.limit stack 3
	
        ;; int a = int 0;
	iconst_0
	istore_0
	
        ;; int b = int a;
	iload_0
	istore_1
	
        ;; int ++ b;
	iload_1
	iconst_1
	iadd
	istore_1
	iload_1
	pop
	
        ;; void printInt (a);
	iload_0
	invokestatic Runtime/printInt(I)V
	
        ;; int b ++;
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	pop
	
        ;; void printInt (a);
	iload_0
	invokestatic Runtime/printInt(I)V
	
        ;; int -- b;
	iload_1
	iconst_1
	isub
	istore_1
	iload_1
	pop
	
        ;; void printInt (a);
	iload_0
	invokestatic Runtime/printInt(I)V
	
        ;; int b --;
	iload_1
	dup
	iconst_1
	isub
	istore_1
	pop
	
        ;; void printInt (a);
	iload_0
	invokestatic Runtime/printInt(I)V
	
        ;; int b = int 832;
	ldc 832
	istore_1
	iload_1
	pop
	
        ;; void printInt (a);
	iload_0
	invokestatic Runtime/printInt(I)V
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

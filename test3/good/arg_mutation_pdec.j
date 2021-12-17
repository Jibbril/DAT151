.class public arg_mutation_pdec
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

  invokestatic arg_mutation_pdec/main()I
  pop
  return

.end method


.method public static cdec(I)V
  .limit locals 1
  .limit stack 3

	
        ;; int c --;
	iload_0
	dup
	iconst_1
	isub
	istore_0
	pop
        return

.end method

.method public static main()I
  .limit locals 1
  .limit stack 2

	
        ;; int c = int 1;
	iconst_1
	istore_0
	
        ;; void cdec (int -- c);
	iload_0
	iconst_1
	isub
	istore_0
	iload_0
	invokestatic arg_mutation_pdec/cdec(I)V
	nop
	
        ;; void printInt (int c);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public arg_mutation_id
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

  invokestatic arg_mutation_id/main()I
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
  .limit stack 1

	
        ;; int c = int 0;
	iconst_0
	istore_0
	
        ;; void cdec (c);
	iload_0
	invokestatic arg_mutation_id/cdec(I)V
	nop
	
        ;; void printInt (c);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

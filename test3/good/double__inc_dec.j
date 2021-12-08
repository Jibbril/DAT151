.class public double__inc_dec
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

  invokestatic double__inc_dec/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 5

	
        ;; double d = double 2.00000000000000;
	ldc2_w 2.0
	dstore_0
	
        ;; void printDouble (d);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; double d ++;
	dload_0
	dup2
	iconst_1
	dadd
	dstore_0
	
        ;; void printDouble (d);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; double d --;
	dload_0
	dup2
	iconst_1
	dsub
	dstore_0
	
        ;; void printDouble (d);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

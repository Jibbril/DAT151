.class public double__postincrement
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

  invokestatic double__postincrement/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 4
  .limit stack 5

	
        ;; double j = double 22.5000000000000;
	ldc2_w 22.5
	dstore_0
	
        ;; double k = double 23.5000000000000;
	ldc2_w 23.5
	dstore_2
	
        ;; double j ++;
	dload_0
	dup2
	iconst_1
	dadd
	dstore_0
	
        ;; void printDouble (j);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; void printDouble (k ++);
	dload_2
	dup2
	iconst_1
	dadd
	dstore_2
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

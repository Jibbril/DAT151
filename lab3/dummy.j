.class public dummy
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

  invokestatic dummy/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 4

	
        ;; double x = double (double 2.00000000000000) * (double double double 3.14000000000000);
	ldc2_w 2.0
	ldc2_w 3.14
	dmul
	dstore_0
	dload_0
	pop2
	
        ;; void printDouble (double x);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

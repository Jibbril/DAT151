.class public ass_double_int
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

  invokestatic ass_double_int/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; double d = double 1;
	iconst_1
	dstore_0
	
        ;; double d = double (double d) / (int 2);
	dload_0
	iconst_2
	ddiv
	dstore_0
	dload_0
	
        ;; void printDouble (double d);
	dload_0
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

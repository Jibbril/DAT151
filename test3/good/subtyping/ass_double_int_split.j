.class public ass_double_int_split
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

  invokestatic ass_double_int_split/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; double x = double 1.00000000000000;
	dconst_1
	dstore_0
	dload_0
	pop2
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

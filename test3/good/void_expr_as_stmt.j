.class public void_expr_as_stmt
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

  invokestatic void_expr_as_stmt/main()I
  pop
  return

.end method


.method public static foo()V
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
        return

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void foo ();
	invokestatic void_expr_as_stmt/foo()V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

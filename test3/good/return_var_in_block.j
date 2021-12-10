.class public return_var_in_block
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

  invokestatic return_var_in_block/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; int x = int 0;
	iconst_0
	istore_0
	
        ;; return int x;
	iload_0
	ireturn
        return

.end method

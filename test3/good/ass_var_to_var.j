.class public ass_var_to_var
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

  invokestatic ass_var_to_var/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 2
.limit stack 1
	
        ;; int x = int 0;
	iconst_0
	istore_0
	
        ;; int y = int x;
	iload_0
	istore_1
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

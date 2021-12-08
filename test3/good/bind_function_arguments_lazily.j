.class public bind_function_arguments_lazily
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

  invokestatic bind_function_arguments_lazily/main()I
  pop
  return

.end method


.method public static snd(II)I
  .limit locals 2
  .limit stack 1

	
        ;; return int y;
	iload_1
	ireturn

.end method

.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; int x = int 0;
	iconst_0
	istore_0
	
        ;; int r = int snd (1, x);
	iconst_1
	iload_0
	invokestatic bind_function_arguments_lazily/snd(II)I
	istore_1
	
        ;; void printInt (r);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int r;
	iload_1
	ireturn

.end method

.class public ass_in_body
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

  invokestatic ass_in_body/main()I
  pop
  return

.end method


.method public static f(I)I
  .limit locals 1
  .limit stack 1

	
        ;; int x = int 7;
	bipush 7
	istore_0
	iload_0
	pop
	
        ;; return int x;
	iload_0
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int f (int 5));
	iconst_5
	invokestatic ass_in_body/f(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public core009
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

  invokestatic core009/main()I
  pop
  return

.end method


.method public static foo()I
  .limit locals 0
  .limit stack 1

	
        ;; return int 10;
	bipush 10
	ireturn

.end method

.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; int x = int foo ();
	invokestatic core009/foo()I
	istore_0
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

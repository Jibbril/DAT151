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
. limit locals 1
. limit stack 1
	
        ;; int x = int 3;
	iconst_3
	istore_0
	
        ;; void printInt (x);
	iload_0
	invokestatic printInt(I)V
	pop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

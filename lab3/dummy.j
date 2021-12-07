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
. limit stack 3
	
        ;; int i = int 1;
	iconst_1
	istore_0
	
        ;; int i ++;
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	pop
	
        ;; int ++ i;
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	pop

.end method

.class public div
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

  invokestatic div/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 0
.limit stack 2
	
        ;; void printInt (5 / 3);
	iconst_5
	iconst_3
	idiv
	invokestatic Runtime/printInt(I)V
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

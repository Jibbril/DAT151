.class public core111
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

  invokestatic core111/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 0
.limit stack 2
	
        ;; void printInt (readInt () - 1);
	invokestatic Runtime/readInt()I
	iconst_1
	isub
	invokestatic Runtime/printInt(I)V
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

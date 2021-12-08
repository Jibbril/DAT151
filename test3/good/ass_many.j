.class public ass_many
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

  invokestatic ass_many/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 3
.limit stack 0
	istore_0
	istore_1
	istore_2
	
        ;; int j = int i = int 6;
	bipush 6
	istore_2
	iload_2
	istore_1
	iload_1
	pop
	
        ;; void printInt (i + j);
	iload_2
	iload_1
	iadd
	invokestatic Runtime/printInt(I)V
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

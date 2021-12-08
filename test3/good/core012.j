.class public core012
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

  invokestatic core012/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 2
.limit stack 2
	
        ;; int x = int 56;
	bipush 56
	istore_0
	
        ;; int y = int 23;
	bipush 23
	istore_1
	
        ;; void printInt (x + y);
	iload_0
	iload_1
	iadd
	invokestatic Runtime/printInt(I)V
	
        ;; void printInt (x - y);
	iload_0
	iload_1
	isub
	invokestatic Runtime/printInt(I)V
	
        ;; void printInt (x * y);
	iload_0
	iload_1
	imul
	invokestatic Runtime/printInt(I)V
	
        ;; void printInt (45 / 2);
	bipush 45
	iconst_2
	idiv
	invokestatic Runtime/printInt(I)V
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public returns_many
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

  invokestatic returns_many/main()I
  pop
  return

.end method


.method public static r()I
  .limit locals 0
  .limit stack 1

	
        ;; return int 12;
	bipush 12
	ireturn
	
        ;; return int 2;
	iconst_2
	ireturn
	
        ;; return int 3;
	iconst_3
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int r ());
	invokestatic returns_many/r()I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn
	
        ;; return int 2;
	iconst_2
	ireturn

.end method

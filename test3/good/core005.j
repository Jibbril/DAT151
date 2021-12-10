.class public core005
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

  invokestatic core005/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; int y = int 56;
	bipush 56
	istore_1
	
        ;; Evaluate if condition: bool (int y + 45) <= (int 2)
	iload_1
	bipush 45
	iadd
	iconst_2
	if_icmple  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int x = int 1;
	iconst_1
	istore_0
	iload_0
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; int x = int 2;
	iconst_2
	istore_0
	iload_0
	pop
	L0:
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

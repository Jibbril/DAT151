.class public core113
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

  invokestatic core113/main()I
  pop
  return

.end method


.method public static f(I)I
  .limit locals 3
  .limit stack 2

	
        ;; Evaluate if condition: bool (int x) < (int 100)
	iload_0
	bipush 100
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int x = int 91;
	bipush 91
	istore_2
	
        ;; int y = int x;
	iload_2
	istore_1
	iload_1
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; int y = int x;
	iload_0
	istore_1
	iload_1
	pop
	L0:
	
        ;; return int y;
	iload_1
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int f (int 45));
	bipush 45
	invokestatic core113/f(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int f (int 450));
	ldc 450
	invokestatic core113/f(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

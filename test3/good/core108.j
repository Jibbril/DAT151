.class public core108
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

  invokestatic core108/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 2

	
        ;; int j = int 4;
	iconst_4
	istore_0
	
        ;; Evaluate if condition: bool (int j) < (int 6)
	iload_0
	bipush 6
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (int j);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; return int j;
	iload_0
	ireturn

.end method

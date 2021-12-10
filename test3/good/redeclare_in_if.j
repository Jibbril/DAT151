.class public redeclare_in_if
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

  invokestatic redeclare_in_if/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 3
  .limit stack 3

	
        ;; int x0 = int 32;
	bipush 32
	istore_0
	
        ;; Evaluate if condition: bool (int 0) < (int 1 - 0)
	iconst_0
	iconst_1
	iconst_0
	isub
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; bool x0 = bool true;
	iconst_1
	istore_1
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; bool x0 = bool false;
	iconst_0
	istore_2
	L0:
	
        ;; void printInt (int x0);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

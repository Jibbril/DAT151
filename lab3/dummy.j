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


.method public static printBool(Z)V
  .limit locals 1
  .limit stack 1

	
        ;; Evaluate if condition: bool b
	iload_0
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	L0:
        return

.end method

.method public static main()I
  .limit locals 0
  .limit stack 4

	
        ;; void printBool (bool (bool true) == (bool true));
	iconst_1
	iconst_1
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	invokestatic dummy/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool true) == (bool false));
	iconst_1
	iconst_0
	if_icmpeq  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	invokestatic dummy/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool true) != (bool false));
	iconst_1
	iconst_0
	if_icmpne  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	invokestatic dummy/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

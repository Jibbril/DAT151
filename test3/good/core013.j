.class public core013
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

  invokestatic core013/main()I
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

.method public static test(I)Z
  .limit locals 1
  .limit stack 2

	
        ;; return bool (int i) > (int 0);
	iload_0
	iconst_0
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 4

	
        ;; void printBool (bool (bool test (int (int 0) - (int 1))) && (bool test (int 0)));
	iconst_0
	iconst_0
	iconst_1
	isub
	invokestatic core013/test(I)Z
	iconst_0
	if_icmpeq  L4
	iconst_0
	invokestatic core013/test(I)Z
	iconst_0
	if_icmpeq  L4
	pop
	iconst_1
	L4:
	invokestatic core013/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool test (int (int 0) - (int 2))) || (bool test (int 1)));
	iconst_1
	iconst_0
	iconst_2
	isub
	invokestatic core013/test(I)Z
	iconst_1
	if_icmpeq  L5
	iconst_1
	invokestatic core013/test(I)Z
	iconst_1
	if_icmpeq  L5
	pop
	iconst_0
	L5:
	invokestatic core013/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool (bool test (int 3)) && (bool test (int (int 0) - (int 5)))) && (bool true));
	iconst_0
	iconst_0
	iconst_3
	invokestatic core013/test(I)Z
	iconst_0
	if_icmpeq  L7
	iconst_0
	iconst_5
	isub
	invokestatic core013/test(I)Z
	iconst_0
	if_icmpeq  L7
	pop
	iconst_1
	L7:
	iconst_0
	if_icmpeq  L6
	iconst_1
	iconst_0
	if_icmpeq  L6
	pop
	iconst_1
	L6:
	invokestatic core013/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool test (int 3)) || (bool (bool test (int (int 0) - (int 5))) && (bool true)));
	iconst_1
	iconst_3
	invokestatic core013/test(I)Z
	iconst_1
	if_icmpeq  L8
	iconst_0
	iconst_0
	iconst_5
	isub
	invokestatic core013/test(I)Z
	iconst_0
	if_icmpeq  L9
	iconst_1
	iconst_0
	if_icmpeq  L9
	pop
	iconst_1
	L9:
	iconst_1
	if_icmpeq  L8
	pop
	iconst_0
	L8:
	invokestatic core013/printBool(Z)V
	nop
	
        ;; void printBool (bool true);
	iconst_1
	invokestatic core013/printBool(Z)V
	nop
	
        ;; void printBool (bool false);
	iconst_0
	invokestatic core013/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

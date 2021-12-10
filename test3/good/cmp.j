.class public cmp
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

  invokestatic cmp/main()I
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
  .limit stack 13

	
        ;; void printBool (bool (int 30) == (int 40));
	bipush 30
	bipush 40
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 30) == (int 30));
	bipush 30
	bipush 30
	if_icmpeq  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 30) != (int 30));
	bipush 30
	bipush 30
	if_icmpne  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 40) != (int 40));
	bipush 40
	bipush 40
	if_icmpne  L8
	iconst_0
	goto L9
	L8:
	iconst_1
	L9:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 3) > (int 4));
	iconst_3
	iconst_4
	if_icmpgt  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 3) > (int 3));
	iconst_3
	iconst_3
	if_icmpgt  L12
	iconst_0
	goto L13
	L12:
	iconst_1
	L13:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 4) < (int 3));
	iconst_4
	iconst_3
	if_icmplt  L14
	iconst_0
	goto L15
	L14:
	iconst_1
	L15:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 4) < (int 4));
	iconst_4
	iconst_4
	if_icmplt  L16
	iconst_0
	goto L17
	L16:
	iconst_1
	L17:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 400) >= (int 300));
	ldc 400
	ldc 300
	if_icmpge  L18
	iconst_0
	goto L19
	L18:
	iconst_1
	L19:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 400) >= (int 400));
	ldc 400
	ldc 400
	if_icmpge  L20
	iconst_0
	goto L21
	L20:
	iconst_1
	L21:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 400) <= (int 300));
	ldc 400
	ldc 300
	if_icmple  L22
	iconst_0
	goto L23
	L22:
	iconst_1
	L23:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (int 400) <= (int 400));
	ldc 400
	ldc 400
	if_icmple  L24
	iconst_0
	goto L25
	L24:
	iconst_1
	L25:
	invokestatic cmp/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

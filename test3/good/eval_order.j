.class public eval_order
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

  invokestatic eval_order/main()I
  pop
  return

.end method


.method public static order(II)I
  .limit locals 2
  .limit stack 1

	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.method public static printIntInt(I)I
  .limit locals 1
  .limit stack 1

	
        ;; void printInt (i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int i;
	iload_0
	ireturn

.end method

.method public static printIntBool(I)Z
  .limit locals 1
  .limit stack 1

	
        ;; void printInt (i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return bool true;
	iconst_1
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 9

	
        ;; int order (printIntInt (0), printIntInt (1));
	iconst_0
	invokestatic eval_order/printIntInt(I)I
	iconst_1
	invokestatic eval_order/printIntInt(I)I
	invokestatic eval_order/order(II)I
	pop
	
        ;; int printIntInt (2) + printIntInt (3);
	iconst_2
	invokestatic eval_order/printIntInt(I)I
	iconst_3
	invokestatic eval_order/printIntInt(I)I
	iadd
	pop
	
        ;; bool (int printIntInt (4)) == (int printIntInt (5));
	iconst_4
	invokestatic eval_order/printIntInt(I)I
	iconst_5
	invokestatic eval_order/printIntInt(I)I
	if_icmpeq  L0
	iconst_0
	goto L1
	L0:
	iconst_1
	L1:
	pop
	
        ;; int printIntInt (6) * printIntInt (7);
	bipush 6
	invokestatic eval_order/printIntInt(I)I
	bipush 7
	invokestatic eval_order/printIntInt(I)I
	imul
	pop
	
        ;; int printIntInt (8) / printIntInt (9);
	bipush 8
	invokestatic eval_order/printIntInt(I)I
	bipush 9
	invokestatic eval_order/printIntInt(I)I
	idiv
	pop
	
        ;; int printIntInt (10) - printIntInt (11);
	bipush 10
	invokestatic eval_order/printIntInt(I)I
	bipush 11
	invokestatic eval_order/printIntInt(I)I
	isub
	pop
	
        ;; bool (int printIntInt (12)) < (int printIntInt (13));
	bipush 12
	invokestatic eval_order/printIntInt(I)I
	bipush 13
	invokestatic eval_order/printIntInt(I)I
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	pop
	
        ;; bool (int printIntInt (14)) > (int printIntInt (15));
	bipush 14
	invokestatic eval_order/printIntInt(I)I
	bipush 15
	invokestatic eval_order/printIntInt(I)I
	if_icmpgt  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	pop
	
        ;; bool (int printIntInt (16)) <= (int printIntInt (17));
	bipush 16
	invokestatic eval_order/printIntInt(I)I
	bipush 17
	invokestatic eval_order/printIntInt(I)I
	if_icmple  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	pop
	
        ;; bool (int printIntInt (18)) >= (int printIntInt (19));
	bipush 18
	invokestatic eval_order/printIntInt(I)I
	bipush 19
	invokestatic eval_order/printIntInt(I)I
	if_icmpge  L8
	iconst_0
	goto L9
	L8:
	iconst_1
	L9:
	pop
	
        ;; bool (int printIntInt (20)) != (int printIntInt (21));
	bipush 20
	invokestatic eval_order/printIntInt(I)I
	bipush 21
	invokestatic eval_order/printIntInt(I)I
	if_icmpne  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	pop
	
        ;; bool (bool printIntBool (22)) && (bool printIntBool (23));
	iconst_0
	bipush 22
	invokestatic eval_order/printIntBool(I)Z
	iconst_0
	if_icmpeq  L12
	bipush 23
	invokestatic eval_order/printIntBool(I)Z
	iconst_0
	if_icmpeq  L12
	pop
	iconst_1
	L12:
	pop
	
        ;; bool (bool printIntBool (24)) || (bool printIntBool (25));
	iconst_1
	bipush 24
	invokestatic eval_order/printIntBool(I)Z
	iconst_1
	if_icmpeq  L13
	bipush 25
	invokestatic eval_order/printIntBool(I)Z
	iconst_1
	if_icmpeq  L13
	pop
	iconst_0
	L13:
	pop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

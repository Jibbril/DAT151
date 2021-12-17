.class public double__cmp
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

  invokestatic double__cmp/main()I
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
  .limit locals 4
  .limit stack 41

	
        ;; double big = double 1.50000000000000;
	ldc2_w 1.5
	dstore_0
	
        ;; double small = double 0.500000000000000;
	ldc2_w 0.5
	dstore_2
	
        ;; void printBool (bool (double big) == (double big));
	dload_0
	dload_0
	dcmpg
	ifeq L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double big) != (double big));
	dload_0
	dload_0
	dcmpg
	iconst_0
	if_icmpne  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double big) > (double small));
	dload_0
	dload_2
	dcmpg
	iconst_1
	if_icmpeq  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double big) > (double big));
	dload_0
	dload_0
	dcmpg
	iconst_1
	if_icmpeq  L8
	iconst_0
	goto L9
	L8:
	iconst_1
	L9:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double small) >= (double big));
	dload_2
	dload_0
	dcmpg
	iconst_0
	if_icmpge  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double small) >= (double small));
	dload_2
	dload_2
	dcmpg
	iconst_0
	if_icmpge  L12
	iconst_0
	goto L13
	L12:
	iconst_1
	L13:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double small) < (double big));
	dload_2
	dload_0
	dcmpg
	iconst_m1
	if_icmpeq  L14
	iconst_0
	goto L15
	L14:
	iconst_1
	L15:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double big) < (double big));
	dload_0
	dload_0
	dcmpg
	iconst_m1
	if_icmpeq  L16
	iconst_0
	goto L17
	L16:
	iconst_1
	L17:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double small) <= (double big));
	dload_2
	dload_0
	dcmpg
	iconst_0
	if_icmple  L18
	iconst_0
	goto L19
	L18:
	iconst_1
	L19:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; void printBool (bool (double small) <= (double small));
	dload_2
	dload_2
	dcmpg
	iconst_0
	if_icmple  L20
	iconst_0
	goto L21
	L20:
	iconst_1
	L21:
	invokestatic double__cmp/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

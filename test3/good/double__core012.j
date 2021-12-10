.class public double__core012
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

  invokestatic double__core012/main()I
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
  .limit stack 13

	
        ;; double z = double 9.30000000000000;
	ldc2_w 9.3
	dstore_0
	
        ;; double w = double 5.10000000000000;
	ldc2_w 5.1
	dstore_2
	
        ;; void printBool (bool (double z + w) > (double z - w));
	dload_0
	dload_2
	iadd
	dload_0
	dload_2
	isub
	dcmpg
	iconst_1
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	invokestatic double__core012/printBool(Z)V
	nop
	
        ;; void printBool (bool (double z / w) <= (double z * w));
	dload_0
	dload_2
	idiv
	dload_0
	dload_2
	imul
	dcmpg
	iconst_0
	if_icmple  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	invokestatic double__core012/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

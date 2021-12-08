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


.method public static main()I
.limit locals 2
.limit stack 5
	
        ;; double i = double 2.50000000000000;
	ldc2_w 2.5
	dstore_0
	
        ;; Evaluate if condition: bool (double i) >= (double 1.50000000000000)
	dload_0
	ldc2_w 1.5
	dcmpg
	iconst_0
	if_icmpge  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (7);
	bipush 7
	invokestatic Runtime/printInt(I)V
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; void printInt (10);
	bipush 10
	invokestatic Runtime/printInt(I)V
	L0:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

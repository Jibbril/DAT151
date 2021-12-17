.class public decr_in_if
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

  invokestatic decr_in_if/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 3

	
        ;; int uw = int 0;
	iconst_0
	istore_0
	
        ;; Evaluate if condition: bool (int uw --) >= (int 0)
	iload_0
	dup
	iconst_1
	isub
	istore_0
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
	
        ;; int 0;
	iconst_0
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; int 0;
	iconst_0
	pop
	L0:
	
        ;; void printInt (int uw);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

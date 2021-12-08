.class public if_state_propagation
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

  invokestatic if_state_propagation/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 2

	
        ;; Evaluate if condition: bool (int x = int 1) == (int 1)
	iconst_1
	istore_0
	iload_0
	iconst_1
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; void printInt (x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

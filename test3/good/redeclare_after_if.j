.class public redeclare_after_if
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

  invokestatic redeclare_after_if/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 2

	
        ;; Evaluate if condition: bool (int 0) <= (int 2)
	iconst_0
	iconst_2
	if_icmple  L2
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
	istore_0
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; int 0;
	iconst_0
	pop
	L0:
	
        ;; int x0 = int 0;
	iconst_0
	istore_1
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

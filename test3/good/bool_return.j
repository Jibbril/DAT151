.class public bool_return
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

  invokestatic bool_return/main()I
  pop
  return

.end method


.method public static c(I)Z
  .limit locals 1
  .limit stack 2

	
        ;; return bool (int d) < (int d);
	iload_0
	iload_0
	if_icmplt  L0
	iconst_0
	goto L1
	L0:
	iconst_1
	L1:
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; Evaluate if condition: bool c (int 0)
	iconst_0
	invokestatic bool_return/c(I)Z
	
        ;; Check if condition is true/false: 
	ifeq L3
	
        ;; If true then do: 
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	goto L2
	
        ;; If false then do: 
	L3:
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	L2:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

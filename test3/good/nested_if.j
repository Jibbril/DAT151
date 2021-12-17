.class public nested_if
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

  invokestatic nested_if/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L3
	
        ;; If true then do: 
	
        ;; void printInt (int 2);
	iconst_2
	invokestatic Runtime/printInt(I)V
	nop
	goto L2
	
        ;; If false then do: 
	L3:
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	L2:
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; void printInt (int 3);
	iconst_3
	invokestatic Runtime/printInt(I)V
	nop
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	L4:
	L0:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

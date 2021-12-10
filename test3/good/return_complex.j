.class public return_complex
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

  invokestatic return_complex/main()I
  pop
  return

.end method


.method public static foo(I)Z
  .limit locals 2
  .limit stack 2

	
        ;; Evaluate if condition: bool (int x) == (int 0)
	iload_0
	iconst_0
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; return bool false;
	iconst_0
	ireturn
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; bool b = bool true;
	iconst_1
	istore_1
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return bool b;
	iload_1
	ireturn

.end method

.method public static printBool(Z)V
  .limit locals 1
  .limit stack 1

	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; Evaluate if condition: bool b
	iload_0
	
        ;; Check if condition is true/false: 
	ifeq L7
	
        ;; If true then do: 
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L6
	
        ;; If false then do: 
	L7:
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	L6:
	L4:
        return

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printBool (bool foo (int 42));
	bipush 42
	invokestatic return_complex/foo(I)Z
	invokestatic return_complex/printBool(Z)V
	nop
	
        ;; void printBool (bool foo (int 0));
	iconst_0
	invokestatic return_complex/foo(I)Z
	invokestatic return_complex/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn
	
        ;; void printBool (bool true);
	iconst_1
	invokestatic return_complex/printBool(Z)V
	nop

.end method

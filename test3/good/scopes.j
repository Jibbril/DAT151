.class public scopes
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

  invokestatic scopes/main()I
  pop
  return

.end method


.method public static f()I
  .limit locals 2
  .limit stack 2

	
        ;; int n = int 2;
	iconst_2
	istore_0
	
        ;; Evaluate if condition: bool (int n) < (int 3)
	iload_0
	iconst_3
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int n = int 3;
	iconst_3
	istore_1
	
        ;; return int n;
	iload_1
	ireturn
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; return int n;
	iload_0
	ireturn

.end method

.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; int n = int 1;
	iconst_1
	istore_0
	
        ;; void printInt (int n);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int f ());
	invokestatic scopes/f()I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int n);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

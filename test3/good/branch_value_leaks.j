.class public branch_value_leaks
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

  invokestatic branch_value_leaks/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 3
.limit stack 3
	
        ;; int x0 = int 0;
	iconst_0
	istore_0
	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int 0;
	iconst_0
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; bool x0 = bool true;
	iconst_1
	istore_1
	L0:
	
        ;; int x1 = int x0 --;
	iload_0
	dup
	iconst_1
	isub
	istore_0
	istore_2
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

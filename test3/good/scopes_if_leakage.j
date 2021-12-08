.class public scopes_if_leakage
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

  invokestatic scopes_if_leakage/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 7
.limit stack 7
	
        ;; bool var = bool true;
	iconst_1
	istore_0
	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int var = int 1;
	iconst_1
	istore_1
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; int var = int 0;
	iconst_0
	istore_2
	L0:
	
        ;; bool (bool var) == (bool true);
	iload_0
	iconst_1
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	pop
	
        ;; bool var1 = bool var;
	iload_0
	istore_3
	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; int var = int 1;
	iconst_1
	istore 4
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; int var = int 0;
	iconst_0
	istore 5
	L4:
	
        ;; bool (bool var) == (bool true);
	iload_0
	iconst_1
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	pop
	
        ;; bool var2 = bool var;
	iload_0
	istore 6
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

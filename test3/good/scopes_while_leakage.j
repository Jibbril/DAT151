.class public scopes_while_leakage
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

  invokestatic scopes_while_leakage/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 4
  .limit stack 3

	
        ;; bool var = bool true;
	iconst_1
	istore_0
	
        ;; int n = int 0;
	iconst_0
	istore_1
	
        ;; While condition (bool (int n ++) < (int 1))
	L0:
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	iconst_1
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int var = int 1;
	iconst_1
	istore_2
	goto L0
	L1:
	
        ;; end while
	
        ;; bool (bool var) == (bool true);
	iload_2
	iconst_1
	if_icmpeq  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	pop
	
        ;; bool var2 = bool var;
	iload_2
	istore_3
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

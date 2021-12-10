.class public core015
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

  invokestatic core015/main()I
  pop
  return

.end method


.method public static ev(I)I
  .limit locals 2
  .limit stack 3

	
        ;; Evaluate if condition: bool (int y) > (int 0)
	iload_0
	iconst_0
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int e = int ev (int y - 2);
	iload_0
	iconst_2
	isub
	invokestatic core015/ev(I)I
	istore_1
	iload_1
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; Evaluate if condition: bool (int y) < (int 0)
	iload_0
	iconst_0
	if_icmplt  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; int e = int 0;
	iconst_0
	istore_1
	iload_1
	pop
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; int e = int 1;
	iconst_1
	istore_1
	iload_1
	pop
	L4:
	L0:
	
        ;; return int e;
	iload_1
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int ev (int 17));
	bipush 17
	invokestatic core015/ev(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

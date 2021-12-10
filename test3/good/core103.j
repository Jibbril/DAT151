.class public core103
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

  invokestatic core103/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 5

	
        ;; int j = int 4;
	iconst_4
	istore_0
	
        ;; While condition (bool (int j) < (int 6))
	L0:
	iload_0
	bipush 6
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int i = int 0;
	iconst_0
	istore_1
	
        ;; int i ++;
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	pop
	
        ;; void printInt (int i);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int j ++;
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; Evaluate if condition: bool (int j) < (int 7)
	iload_0
	bipush 7
	if_icmplt  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; int j ++;
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	pop
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; int j --;
	iload_0
	dup
	iconst_1
	isub
	istore_0
	pop
	L4:
	
        ;; void printInt (int j);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int j;
	iload_0
	ireturn

.end method

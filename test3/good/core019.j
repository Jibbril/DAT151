.class public core019
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

  invokestatic core019/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 4
  .limit stack 4

	
        ;; int i = int 78;
	bipush 78
	istore_0
	
        ;; int i = int 1;
	iconst_1
	istore_1
	
        ;; void printInt (int i);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; While condition (bool (int i) > (int 76))
	L0:
	iload_0
	bipush 76
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int i --;
	iload_0
	dup
	iconst_1
	isub
	istore_0
	pop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int i = int 7;
	bipush 7
	istore_2
	
        ;; void printInt (int i);
	iload_2
	invokestatic Runtime/printInt(I)V
	nop
	goto L0
	L1:
	
        ;; end while
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool (int i) > (int 4)
	iload_0
	iconst_4
	if_icmpgt  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; int i = int 4;
	iconst_4
	istore_3
	
        ;; void printInt (int i);
	iload_3
	invokestatic Runtime/printInt(I)V
	nop
	goto L4
	
        ;; If false then do: 
	L5:
	L4:
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

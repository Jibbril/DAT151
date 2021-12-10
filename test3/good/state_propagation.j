.class public state_propagation
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

  invokestatic state_propagation/main()I
  pop
  return

.end method


.method public static id(I)I
  .limit locals 1
  .limit stack 1

	
        ;; return int x;
	iload_0
	ireturn

.end method

.method public static main()I
  .limit locals 1
  .limit stack 7

	
        ;; int z = int 0;
	iconst_0
	istore_0
	
        ;; int id (int ++ z);
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	invokestatic state_propagation/id(I)I
	pop
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int id (int z = int z + 1);
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	invokestatic state_propagation/id(I)I
	pop
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int z ++ + z ++;
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iadd
	pop
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; bool (int z ++) == (int z ++);
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	if_icmpeq  L0
	iconst_0
	goto L1
	L0:
	iconst_1
	L1:
	pop
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool (int ++ z) == (int 7)
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	bipush 7
	if_icmpeq  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	
        ;; Check if condition is true/false: 
	ifeq L3
	
        ;; If true then do: 
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L2
	
        ;; If false then do: 
	L3:
	L2:
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool (int z ++) == (int 8)
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	bipush 8
	if_icmpeq  L8
	iconst_0
	goto L9
	L8:
	iconst_1
	L9:
	
        ;; Check if condition is true/false: 
	ifeq L7
	
        ;; If true then do: 
	goto L6
	
        ;; If false then do: 
	L7:
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	L6:
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; While condition (bool (int ++ z) == (int 9))
	L10:
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	bipush 9
	if_icmpeq  L12
	iconst_0
	goto L13
	L12:
	iconst_1
	L13:
	ifeq L11
	
        ;; do {
  void printInt (int z);
}

	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L10
	L11:
	
        ;; end while
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; While condition (bool (int z ++) == (int 11))
	L14:
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	bipush 11
	if_icmpeq  L16
	iconst_0
	goto L17
	L16:
	iconst_1
	L17:
	ifeq L15
	
        ;; do {
}

	goto L14
	L15:
	
        ;; end while
	
        ;; void printInt (int z);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

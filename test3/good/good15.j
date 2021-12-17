.class public good15
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

  invokestatic good15/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 9

	
        ;; int i = int 1;
	iconst_1
	istore_0
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; bool (bool true) || (bool (int i ++) != (int 45));
	iconst_1
	iconst_1
	iconst_1
	if_icmpeq  L0
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	bipush 45
	if_icmpne  L1
	iconst_0
	goto L2
	L1:
	iconst_1
	L2:
	iconst_1
	if_icmpeq  L0
	pop
	iconst_0
	L0:
	pop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; bool (bool false) || (bool (int i ++) >= (int 0));
	iconst_1
	iconst_0
	iconst_1
	if_icmpeq  L3
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iconst_0
	if_icmpge  L4
	iconst_0
	goto L5
	L4:
	iconst_1
	L5:
	iconst_1
	if_icmpeq  L3
	pop
	iconst_0
	L3:
	pop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; bool (bool true) && (bool (int i ++) < (int 0));
	iconst_0
	iconst_1
	iconst_0
	if_icmpeq  L6
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iconst_0
	if_icmplt  L7
	iconst_0
	goto L8
	L7:
	iconst_1
	L8:
	iconst_0
	if_icmpeq  L6
	pop
	iconst_1
	L6:
	pop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; bool (bool false) && (bool (int i ++) > (int 0));
	iconst_0
	iconst_0
	iconst_0
	if_icmpeq  L9
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iconst_0
	if_icmpgt  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	iconst_0
	if_icmpeq  L9
	pop
	iconst_1
	L9:
	pop
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int j = int 0;
	iconst_0
	istore_1
	
        ;; Evaluate if condition: bool (bool (int 34) < (int 6)) && (bool (int j) < (int 0))
	iconst_0
	bipush 34
	bipush 6
	if_icmplt  L15
	iconst_0
	goto L16
	L15:
	iconst_1
	L16:
	iconst_0
	if_icmpeq  L14
	iload_1
	iconst_0
	if_icmplt  L17
	iconst_0
	goto L18
	L17:
	iconst_1
	L18:
	iconst_0
	if_icmpeq  L14
	pop
	iconst_1
	L14:
	
        ;; Check if condition is true/false: 
	ifeq L13
	
        ;; If true then do: 
	
        ;; void printInt (int i);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L12
	
        ;; If false then do: 
	L13:
	
        ;; void printInt (int 42);
	bipush 42
	invokestatic Runtime/printInt(I)V
	nop
	L12:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public scopes_reuse_name
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

  invokestatic scopes_reuse_name/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 11
  .limit stack 4

	
        ;; int x = int 0;
	iconst_0
	istore_0
	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int x = int 1;
	iconst_1
	istore_1
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L3
	
        ;; If true then do: 
	
        ;; int x = int 2;
	iconst_2
	istore_2
	iload_2
	pop
	goto L2
	
        ;; If false then do: 
	L3:
	L2:
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; int x = int 3;
	iconst_3
	istore_3
	L4:
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L7
	
        ;; If true then do: 
	goto L6
	
        ;; If false then do: 
	L7:
	
        ;; int x = int 4;
	iconst_4
	istore 4
	iload 4
	pop
	L6:
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int i = int 0;
	iconst_0
	istore 5
	
        ;; While condition (bool (int i ++) < (int 1))
	L8:
	iload 5
	dup
	iconst_1
	iadd
	istore 5
	iconst_1
	if_icmplt  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	ifeq L9
	
        ;; do {
  int x = int 5;
}

	
        ;; int x = int 5;
	iconst_5
	istore 6
	goto L8
	L9:
	
        ;; end while
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int i = int 0;
	iconst_0
	istore 7
	
        ;; While condition (bool (int i ++) < (int 1))
	L12:
	iload 7
	dup
	iconst_1
	iadd
	istore 7
	iconst_1
	if_icmplt  L14
	iconst_0
	goto L15
	L14:
	iconst_1
	L15:
	ifeq L13
	
        ;; do {
  int x;
  int x = int 6;
}

	
        ;; int x = int 6;
	bipush 6
	istore 8
	iload 8
	pop
	goto L12
	L13:
	
        ;; end while
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int x = int 7;
	bipush 7
	istore 9
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int x = int 8;
	bipush 8
	istore 10
	iload 10
	pop
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

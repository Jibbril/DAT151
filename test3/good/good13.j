.class public good13
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

  invokestatic good13/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 4
  .limit stack 7

	
        ;; int n = int readInt ();
	invokestatic Runtime/readInt()I
	istore_0
	iload_0
	pop
	
        ;; int i = int 2;
	iconst_2
	istore_1
	iload_1
	pop
	
        ;; While condition (bool (int i) <= (int n))
	L0:
	iload_1
	iload_0
	if_icmple  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; bool iPrime = bool true;
	iconst_1
	istore_2
	
        ;; int j = int 2;
	iconst_2
	istore_3
	
        ;; While condition (bool (bool (int (int j) * (int j)) <= (int i)) && (bool iPrime))
	L4:
	iconst_0
	iload_3
	iload_3
	imul
	iload_1
	if_icmple  L7
	iconst_0
	goto L8
	L7:
	iconst_1
	L8:
	iconst_0
	if_icmpeq  L6
	iload_2
	iconst_0
	if_icmpeq  L6
	pop
	iconst_1
	L6:
	ifeq L5
	
        ;; do: 
	
        ;; Evaluate if condition: bool (int (int (int i) / (int j)) * (int j)) == (int i)
	iload_1
	iload_3
	idiv
	iload_3
	imul
	iload_1
	if_icmpeq  L11
	iconst_0
	goto L12
	L11:
	iconst_1
	L12:
	
        ;; Check if condition is true/false: 
	ifeq L10
	
        ;; If true then do: 
	
        ;; bool iPrime = bool false;
	iconst_0
	istore_2
	iload_2
	pop
	goto L9
	
        ;; If false then do: 
	L10:
	L9:
	
        ;; int j ++;
	iload_3
	dup
	iconst_1
	iadd
	istore_3
	pop
	goto L4
	L5:
	
        ;; end while
	
        ;; Evaluate if condition: bool (bool iPrime) && (bool (int (int (int n) / (int i)) * (int i)) == (int n))
	iconst_0
	iload_2
	iconst_0
	if_icmpeq  L15
	iload_0
	iload_1
	idiv
	iload_1
	imul
	iload_0
	if_icmpeq  L16
	iconst_0
	goto L17
	L16:
	iconst_1
	L17:
	iconst_0
	if_icmpeq  L15
	pop
	iconst_1
	L15:
	
        ;; Check if condition is true/false: 
	ifeq L14
	
        ;; If true then do: 
	
        ;; void printInt (int i);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int n = int (int n) / (int i);
	iload_0
	iload_1
	idiv
	istore_0
	iload_0
	pop
	goto L13
	
        ;; If false then do: 
	L14:
	
        ;; int i ++;
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	pop
	L13:
	goto L0
	L1:
	
        ;; end while
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public good11
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

  invokestatic good11/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 3
  .limit stack 4

	
        ;; int sum = int 0;
	iconst_0
	istore_0
	
        ;; int num = int 0;
	iconst_0
	istore_1
	
        ;; While condition (bool (int x = int readInt ()) != (int 0))
	L0:
	invokestatic Runtime/readInt()I
	istore_2
	iload_2
	iconst_0
	if_icmpne  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do {
  int sum = int sum + x;
  int num ++;
}

	
        ;; int sum = int sum + x;
	iload_0
	iload_2
	iadd
	istore_0
	iload_0
	pop
	
        ;; int num ++;
	iload_1
	dup
	iconst_1
	iadd
	istore_1
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; void printInt (int sum / num);
	iload_0
	iload_1
	idiv
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public good05
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

  invokestatic good05/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 3
  .limit stack 3

	
        ;; int lo = int 1;
	iconst_1
	istore_0
	iload_0
	pop
	
        ;; int hi = int lo;
	iload_0
	istore_1
	iload_1
	pop
	
        ;; int mx = int readInt ();
	invokestatic Runtime/readInt()I
	istore_2
	iload_2
	pop
	
        ;; void printInt (int lo);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; While condition (bool (int hi) < (int mx))
	L0:
	iload_1
	iload_2
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do {
  void printInt (int hi);
  int hi = int lo + hi;
  int lo = int hi - lo;
}

	
        ;; void printInt (int hi);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; int hi = int lo + hi;
	iload_0
	iload_1
	iadd
	istore_1
	iload_1
	pop
	
        ;; int lo = int hi - lo;
	iload_1
	iload_0
	isub
	istore_0
	iload_0
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

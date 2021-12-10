.class public return_in_while
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

  invokestatic return_in_while/main()I
  pop
  return

.end method


.method public static rRrrrRrrrReturn()I
  .limit locals 1
  .limit stack 3

	
        ;; int i = int 0;
	iconst_0
	istore_0
	
        ;; While condition (bool (int i ++) < (int 5))
	L0:
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	iconst_5
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do {
  return int 71;
}

	
        ;; return int 71;
	bipush 71
	ireturn
	goto L0
	L1:
	
        ;; end while
	
        ;; return int 52;
	bipush 52
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int rRrrrRrrrReturn ());
	invokestatic return_in_while/rRrrrRrrrReturn()I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

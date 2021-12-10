.class public ass_in_while
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

  invokestatic ass_in_while/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 2

	
        ;; int x = int 5;
	iconst_5
	istore_0
	
        ;; While condition (bool (int x) == (int 5))
	L0:
	iload_0
	iconst_5
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do int x = int 7;

	
        ;; int x = int 7;
	bipush 7
	istore_0
	iload_0
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

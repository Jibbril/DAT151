.class public redeclare_in_while
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

  invokestatic redeclare_in_while/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 3

	
        ;; int n = int 0;
	iconst_0
	istore_0
	
        ;; While condition (bool (int n ++) < (int 10))
	L0:
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	bipush 10
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int n = int 100;
	bipush 100
	istore_1
	goto L0
	L1:
	
        ;; end while
	
        ;; void printInt (int n);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

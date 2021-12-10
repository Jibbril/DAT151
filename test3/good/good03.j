.class public good03
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

  invokestatic good03/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 3
  .limit stack 3

	
        ;; int arg = int readInt ();
	invokestatic Runtime/readInt()I
	istore_0
	
        ;; int ret = int 1;
	iconst_1
	istore_1
	
        ;; int i = int 1;
	iconst_1
	istore_2
	
        ;; While condition (bool (int i) < (int arg + 1))
	L0:
	iload_2
	iload_0
	iconst_1
	iadd
	if_icmplt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int ret = int i * ret;
	iload_2
	iload_1
	imul
	istore_1
	iload_1
	pop
	
        ;; int ++ i;
	iload_2
	iconst_1
	iadd
	istore_2
	iload_2
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; void printInt (int ret);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

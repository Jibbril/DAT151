.class public core105
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

  invokestatic core105/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 4

	
        ;; int x = int 5;
	iconst_5
	istore_0
	
        ;; While condition (bool (int x) > (int 3))
	L0:
	iload_0
	iconst_3
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; void printInt (int x --);
	iload_0
	dup
	iconst_1
	isub
	istore_0
	invokestatic Runtime/printInt(I)V
	nop
	goto L0
	L1:
	
        ;; end while
	
        ;; return int x;
	iload_0
	ireturn

.end method

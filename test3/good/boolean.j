.class public boolean
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

  invokestatic boolean/main()I
  pop
  return

.end method


.method public static ff()Z
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return bool false;
	iconst_0
	ireturn

.end method

.method public static tt()Z
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return bool true;
	iconst_1
	ireturn

.end method

.method public static main()I
  .limit locals 6
  .limit stack 3

	
        ;; bool t = bool true;
	iconst_1
	istore_0
	
        ;; bool f = bool false;
	iconst_0
	istore_1
	
        ;; bool silent1 = bool (bool f) && (bool ff ());
	iconst_0
	iload_1
	iconst_0
	if_icmpeq  L0
	invokestatic boolean/ff()Z
	iconst_0
	if_icmpeq  L0
	pop
	iconst_1
	L0:
	istore_2
	
        ;; bool silent2 = bool (bool t) || (bool ff ());
	iconst_1
	iload_0
	iconst_1
	if_icmpeq  L1
	invokestatic boolean/ff()Z
	iconst_1
	if_icmpeq  L1
	pop
	iconst_0
	L1:
	istore_3
	
        ;; bool noisy1 = bool (bool t) && (bool tt ());
	iconst_0
	iload_0
	iconst_0
	if_icmpeq  L2
	invokestatic boolean/tt()Z
	iconst_0
	if_icmpeq  L2
	pop
	iconst_1
	L2:
	istore 4
	
        ;; bool noisy2 = bool (bool f) || (bool tt ());
	iconst_1
	iload_1
	iconst_1
	if_icmpeq  L3
	invokestatic boolean/tt()Z
	iconst_1
	if_icmpeq  L3
	pop
	iconst_0
	L3:
	istore 5
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

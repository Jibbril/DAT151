.class public cmp_while_double_int_plus_int
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

  invokestatic cmp_while_double_int_plus_int/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 5

	
        ;; While condition (bool (double 5.32400000000000) >= (int 1 + 43))
	L0:
	ldc2_w 5.324
	iconst_1
	bipush 43
	iadd
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do {
}

	goto L0
	L1:
	
        ;; end while
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

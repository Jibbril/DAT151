.class public cmp_double_eq_int
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

  invokestatic cmp_double_eq_int/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 5

	
        ;; bool (double double double 1.10000000000000) == (double 1.00000000000000);
	ldc2_w 1.1
	dconst_1
	dcmpg
	ifeq L0
	iconst_0
	goto L1
	L0:
	iconst_1
	L1:
	pop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

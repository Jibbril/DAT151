.class public cmp_int_ineq_double
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

  invokestatic cmp_int_ineq_double/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 5

	
        ;; bool (double 1.00000000000000) != (double 1.10000000000000);
	dconst_1
	ldc2_w 1.1
	dcmpg
	iconst_0
	if_icmpne  L0
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

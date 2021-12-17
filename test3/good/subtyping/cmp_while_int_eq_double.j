.class public cmp_while_int_eq_double
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

  invokestatic cmp_while_int_eq_double/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 5

	
        ;; While condition (bool (double 3.00000000000000) == (double 3.10000000000000))
	L0:
	ldc2_w 3.0
	ldc2_w 3.1
	dcmpg
	ifeq L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	goto L0
	L1:
	
        ;; end while
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

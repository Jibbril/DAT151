.class public cmp_if_double_lt_int
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

  invokestatic cmp_if_double_lt_int/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 1
.limit stack 5
	
        ;; Evaluate if condition: bool (double 3.00000000000000) < (int 5)
	ldc2_w 3.0
	iconst_5
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	istore_0
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

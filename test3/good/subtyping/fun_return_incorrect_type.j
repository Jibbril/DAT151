.class public fun_return_incorrect_type
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

  invokestatic fun_return_incorrect_type/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 0
  .limit stack 5

	
        ;; Evaluate if condition: bool (double c (int 99)) == (double 99.0000000000000)
	bipush 99
	invokestatic fun_return_incorrect_type/c(I)D
	ldc2_w 99.0
	dcmpg
	ifeq L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	L0:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.method public static c(I)D
  .limit locals 1
  .limit stack 2

	
        ;; return int x;
	iload_0
	i2d
	dreturn

.end method

.class public double__small_program_fac
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

  invokestatic double__small_program_fac/main()I
  pop
  return

.end method


.method public static dfac(D)D
  .limit locals 4
  .limit stack 10

	
        ;; Evaluate if condition: bool (double n) == (double 0.00000000000000)
	dload_0
	dconst_0
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
	
        ;; double f = double 1.00000000000000;
	dconst_1
	dstore_2
	dload_2
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; double f = double n * dfac (n - 1.00000000000000);
	dload_0
	dload_0
	dconst_1
	isub
	invokestatic double__small_program_fac/dfac(D)D
	imul
	dstore_2
	dload_2
	L0:
	
        ;; return double f;
	dload_2
	dreturn

.end method

.method public static main()I
  .limit locals 4
  .limit stack 3

	
        ;; int n = int 10;
	bipush 10
	istore_2
	
        ;; int r = int 1;
	iconst_1
	istore_3
	
        ;; While condition (bool (int n) > (int 0))
	L4:
	iload_2
	iconst_0
	if_icmpgt  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	ifeq L5
	
        ;; do: 
	
        ;; int r = int r * n;
	iload_3
	iload_2
	imul
	istore_3
	iload_3
	pop
	
        ;; int n = int n - 1;
	iload_2
	iconst_1
	isub
	istore_2
	iload_2
	pop
	goto L4
	L5:
	
        ;; end while
	
        ;; void printInt (int r);
	iload_3
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printDouble (double dfac (double 10.0000000000000));
	ldc2_w 10.0
	invokestatic double__small_program_fac/dfac(D)D
	invokestatic Runtime/printDouble(D)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public small_program_fac
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

  invokestatic small_program_fac/main()I
  pop
  return

.end method


.method public static fac(I)I
  .limit locals 3
  .limit stack 3

	
        ;; int r = int 1;
	iconst_1
	istore_1
	iload_1
	pop
	
        ;; int n = int a;
	iload_0
	istore_2
	iload_2
	pop
	
        ;; While condition (bool (int n) > (int 0))
	L0:
	iload_2
	iconst_0
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do: 
	
        ;; int r = int (int r) * (int n);
	iload_1
	iload_2
	imul
	istore_1
	iload_1
	pop
	
        ;; int n = int (int n) - (int 1);
	iload_2
	iconst_1
	isub
	istore_2
	iload_2
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; return int r;
	iload_1
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int fac (int 5));
	iconst_5
	invokestatic small_program_fac/fac(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

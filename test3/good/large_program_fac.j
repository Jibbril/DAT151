.class public large_program_fac
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

  invokestatic large_program_fac/main()I
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

.method public static rfac(I)I
  .limit locals 2
  .limit stack 4

	
        ;; Evaluate if condition: bool (int n) == (int 0)
	iload_0
	iconst_0
	if_icmpeq  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; int f = int 1;
	iconst_1
	istore_1
	iload_1
	pop
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; int f = int (int n) * (int rfac (int (int n) - (int 1)));
	iload_0
	iload_0
	iconst_1
	isub
	invokestatic large_program_fac/rfac(I)I
	imul
	istore_1
	iload_1
	pop
	L4:
	
        ;; return int f;
	iload_1
	ireturn

.end method

.method public static mfac(I)I
  .limit locals 2
  .limit stack 4

	
        ;; Evaluate if condition: bool (int n) == (int 0)
	iload_0
	iconst_0
	if_icmpeq  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	
        ;; Check if condition is true/false: 
	ifeq L9
	
        ;; If true then do: 
	
        ;; int f = int 1;
	iconst_1
	istore_1
	iload_1
	pop
	goto L8
	
        ;; If false then do: 
	L9:
	
        ;; int f = int (int n) * (int nfac (int (int n) - (int 1)));
	iload_0
	iload_0
	iconst_1
	isub
	invokestatic large_program_fac/nfac(I)I
	imul
	istore_1
	iload_1
	pop
	L8:
	
        ;; return int f;
	iload_1
	ireturn

.end method

.method public static nfac(I)I
  .limit locals 2
  .limit stack 3

	
        ;; Evaluate if condition: bool (int n) != (int 0)
	iload_0
	iconst_0
	if_icmpne  L14
	iconst_0
	goto L15
	L14:
	iconst_1
	L15:
	
        ;; Check if condition is true/false: 
	ifeq L13
	
        ;; If true then do: 
	
        ;; int f = int (int mfac (int (int n) - (int 1))) * (int n);
	iload_0
	iconst_1
	isub
	invokestatic large_program_fac/mfac(I)I
	iload_0
	imul
	istore_1
	iload_1
	pop
	goto L12
	
        ;; If false then do: 
	L13:
	
        ;; int f = int 1;
	iconst_1
	istore_1
	iload_1
	pop
	L12:
	
        ;; return int f;
	iload_1
	ireturn

.end method

.method public static ifac2f(II)I
  .limit locals 4
  .limit stack 5

	
        ;; Evaluate if condition: bool (int l) == (int h)
	iload_0
	iload_1
	if_icmpeq  L18
	iconst_0
	goto L19
	L18:
	iconst_1
	L19:
	
        ;; Check if condition is true/false: 
	ifeq L17
	
        ;; If true then do: 
	
        ;; int f = int l;
	iload_0
	istore_2
	iload_2
	pop
	goto L16
	
        ;; If false then do: 
	L17:
	
        ;; Evaluate if condition: bool (int l) > (int h)
	iload_0
	iload_1
	if_icmpgt  L22
	iconst_0
	goto L23
	L22:
	iconst_1
	L23:
	
        ;; Check if condition is true/false: 
	ifeq L21
	
        ;; If true then do: 
	
        ;; int f = int 1;
	iconst_1
	istore_2
	iload_2
	pop
	goto L20
	
        ;; If false then do: 
	L21:
	
        ;; int m = int (int (int l) + (int h)) / (int 2);
	iload_0
	iload_1
	iadd
	iconst_2
	idiv
	istore_3
	iload_3
	pop
	
        ;; int f = int (int ifac2f (int l, int m)) * (int ifac2f (int (int m) + (int 1), int h));
	iload_0
	iload_3
	invokestatic large_program_fac/ifac2f(II)I
	iload_3
	iconst_1
	iadd
	iload_1
	invokestatic large_program_fac/ifac2f(II)I
	imul
	istore_2
	iload_2
	pop
	L20:
	L16:
	
        ;; return int f;
	iload_2
	ireturn

.end method

.method public static ifac(I)I
  .limit locals 1
  .limit stack 2

	
        ;; return int ifac2f (int 1, int n);
	iconst_1
	iload_0
	invokestatic large_program_fac/ifac2f(II)I
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (int fac (int 10));
	bipush 10
	invokestatic large_program_fac/fac(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int rfac (int 10));
	bipush 10
	invokestatic large_program_fac/rfac(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int mfac (int 10));
	bipush 10
	invokestatic large_program_fac/mfac(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; void printInt (int ifac (int 10));
	bipush 10
	invokestatic large_program_fac/ifac(I)I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

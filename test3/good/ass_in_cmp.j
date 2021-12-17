.class public ass_in_cmp
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

  invokestatic ass_in_cmp/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 4

	
        ;; int x = int 5;
	iconst_5
	istore_0
	
        ;; Evaluate if condition: bool (int ++ x) == (int x ++)
	iload_0
	iconst_1
	iadd
	istore_0
	iload_0
	iload_0
	dup
	iconst_1
	iadd
	istore_0
	if_icmpeq  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (int x);
	iload_0
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

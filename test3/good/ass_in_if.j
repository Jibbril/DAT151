.class public ass_in_if
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

  invokestatic ass_in_if/main()I
  pop
  return

.end method


.method public static nop()V
  .limit locals 0
  .limit stack 0

        return

.end method

.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; int x = int 5;
	iconst_5
	istore_0
	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int x = int 7;
	bipush 7
	istore_0
	iload_0
	pop
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; void nop ();
	invokestatic ass_in_if/nop()V
	nop
	L0:
	
        ;; void printInt (x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

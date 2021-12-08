.class public desugar_stmt_to_block
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

  invokestatic desugar_stmt_to_block/main()I
  pop
  return

.end method


.method public static f()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 1;
	iconst_1
	ireturn

.end method

.method public static main()I
  .limit locals 1
  .limit stack 1

	
        ;; Evaluate if condition: bool true
	iconst_1
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; int x = int f ();
	invokestatic desugar_stmt_to_block/f()I
	istore_0
	goto L0
	
        ;; If false then do: 
	L1:
	L0:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

.class public return_in_if_right
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

  invokestatic return_in_if_right/main()I
  pop
  return

.end method


.method public static g()I
  .limit locals 0
  .limit stack 1

	
        ;; Evaluate if condition: bool false
	iconst_0
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; return int 12;
	bipush 12
	ireturn
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; return int 11;
	bipush 11
	ireturn
	L0:
	
        ;; return int 10;
	bipush 10
	ireturn

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void printInt (g ());
	invokestatic return_in_if_right/g()I
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

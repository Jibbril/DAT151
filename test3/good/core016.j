.class public core016
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

  invokestatic core016/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 1
  .limit stack 3

	
        ;; int y = int 17;
	bipush 17
	istore_0
	
        ;; While condition (bool (int y) > (int 0))
	L0:
	iload_0
	iconst_0
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do int y = int y - 2;

	
        ;; int y = int y - 2;
	iload_0
	iconst_2
	isub
	istore_0
	iload_0
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; Evaluate if condition: bool (int y) < (int 0)
	iload_0
	iconst_0
	if_icmplt  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; void printInt (int 0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; void printInt (int 1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn
	L4:
        return

.end method

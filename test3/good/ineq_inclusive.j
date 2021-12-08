.class public ineq_inclusive
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

  invokestatic ineq_inclusive/main()I
  pop
  return

.end method


.method public static main()I
.limit locals 0
.limit stack 5
	
        ;; Evaluate if condition: bool (int 0) >= (int 0)
	iconst_0
	iconst_0
	if_icmpge  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (0);
	iconst_0
	invokestatic Runtime/printInt(I)V
	goto L0
	
        ;; If false then do: 
	L1:
	
        ;; void printInt (1);
	iconst_1
	invokestatic Runtime/printInt(I)V
	L0:
	
        ;; Evaluate if condition: bool (int 1) >= (int 1)
	iconst_1
	iconst_1
	if_icmpge  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; void printInt (2);
	iconst_2
	invokestatic Runtime/printInt(I)V
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; void printInt (3);
	iconst_3
	invokestatic Runtime/printInt(I)V
	L4:
	
        ;; Evaluate if condition: bool (int 2) <= (int 2)
	iconst_2
	iconst_2
	if_icmple  L10
	iconst_0
	goto L11
	L10:
	iconst_1
	L11:
	
        ;; Check if condition is true/false: 
	ifeq L9
	
        ;; If true then do: 
	
        ;; void printInt (4);
	iconst_4
	invokestatic Runtime/printInt(I)V
	goto L8
	
        ;; If false then do: 
	L9:
	
        ;; void printInt (5);
	iconst_5
	invokestatic Runtime/printInt(I)V
	L8:
	
        ;; Evaluate if condition: bool (int 0) <= (int 0)
	iconst_0
	iconst_0
	if_icmple  L14
	iconst_0
	goto L15
	L14:
	iconst_1
	L15:
	
        ;; Check if condition is true/false: 
	ifeq L13
	
        ;; If true then do: 
	
        ;; void printInt (6);
	bipush 6
	invokestatic Runtime/printInt(I)V
	goto L12
	
        ;; If false then do: 
	L13:
	
        ;; void printInt (7);
	bipush 7
	invokestatic Runtime/printInt(I)V
	L12:
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

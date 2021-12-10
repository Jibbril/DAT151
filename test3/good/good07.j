.class public good07
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

  invokestatic good07/main()I
  pop
  return

.end method


.method public static main()I
  .limit locals 2
  .limit stack 5

	
        ;; int x = int readInt ();
	invokestatic Runtime/readInt()I
	istore_0
	
        ;; int d = int x / 2;
	iload_0
	iconst_2
	idiv
	istore_1
	
        ;; While condition (bool (int d) > (int 1))
	L0:
	iload_1
	iconst_1
	if_icmpgt  L2
	iconst_0
	goto L3
	L2:
	iconst_1
	L3:
	ifeq L1
	
        ;; do {
  if (bool (int d * (x / d)) == (int x)) void printInt (int d);
  else
  {
  }
  int d --;
}

	
        ;; Evaluate if condition: bool (int d * (x / d)) == (int x)
	iload_1
	iload_0
	iload_1
	idiv
	imul
	iload_0
	if_icmpeq  L6
	iconst_0
	goto L7
	L6:
	iconst_1
	L7:
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; void printInt (int d);
	iload_1
	invokestatic Runtime/printInt(I)V
	nop
	goto L4
	
        ;; If false then do: 
	L5:
	L4:
	
        ;; int d --;
	iload_1
	dup
	iconst_1
	isub
	istore_1
	pop
	goto L0
	L1:
	
        ;; end while
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

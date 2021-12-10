.class public core017
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

  invokestatic core017/main()I
  pop
  return

.end method


.method public static dontCallMe(I)Z
  .limit locals 1
  .limit stack 1

	
        ;; void printInt (int x);
	iload_0
	invokestatic Runtime/printInt(I)V
	nop
	
        ;; return bool true;
	iconst_1
	ireturn

.end method

.method public static printBool(Z)V
  .limit locals 1
  .limit stack 1

	
        ;; Evaluate if condition: bool b
	iload_0
	
        ;; Check if condition is true/false: 
	ifeq L1
	
        ;; If true then do: 
	
        ;; void printInt (int 1);
	iconst_1
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
        return

.end method

.method public static neg(Z)Z
  .limit locals 2
  .limit stack 1

	
        ;; Evaluate if condition: bool x
	iload_0
	
        ;; Check if condition is true/false: 
	ifeq L3
	
        ;; If true then do: 
	
        ;; bool r = bool false;
	iconst_0
	istore_1
	iload_1
	pop
	goto L2
	
        ;; If false then do: 
	L3:
	
        ;; bool r = bool true;
	iconst_1
	istore_1
	iload_1
	pop
	L2:
	
        ;; return bool r;
	iload_1
	ireturn

.end method

.method public static eq_bool(ZZ)Z
  .limit locals 3
  .limit stack 1

	
        ;; Evaluate if condition: bool x
	iload_0
	
        ;; Check if condition is true/false: 
	ifeq L5
	
        ;; If true then do: 
	
        ;; bool r = bool y;
	iload_1
	istore_2
	iload_2
	pop
	goto L4
	
        ;; If false then do: 
	L5:
	
        ;; bool r = bool neg (bool y);
	iload_1
	invokestatic core017/neg(Z)Z
	istore_2
	iload_2
	pop
	L4:
	
        ;; return bool r;
	iload_2
	ireturn

.end method

.method public static implies(ZZ)Z
  .limit locals 2
  .limit stack 3

	
        ;; return bool (bool neg (bool x)) || (bool eq_bool (bool x, bool y));
	iconst_1
	iload_0
	invokestatic core017/neg(Z)Z
	iconst_1
	if_icmpeq  L6
	iload_0
	iload_1
	invokestatic core017/eq_bool(ZZ)Z
	iconst_1
	if_icmpeq  L6
	pop
	iconst_0
	L6:
	ireturn

.end method

.method public static main()I
  .limit locals 1
  .limit stack 8

	
        ;; int x = int 4;
	iconst_4
	istore_0
	
        ;; Evaluate if condition: bool (bool (bool (int 3) <= (int x)) && (bool (int 4) != (int 2))) && (bool true)
	iconst_0
	iconst_0
	iconst_3
	iload_0
	if_icmple  L11
	iconst_0
	goto L12
	L11:
	iconst_1
	L12:
	iconst_0
	if_icmpeq  L10
	iconst_4
	iconst_2
	if_icmpne  L13
	iconst_0
	goto L14
	L13:
	iconst_1
	L14:
	iconst_0
	if_icmpeq  L10
	pop
	iconst_1
	L10:
	iconst_0
	if_icmpeq  L9
	iconst_1
	iconst_0
	if_icmpeq  L9
	pop
	iconst_1
	L9:
	
        ;; Check if condition is true/false: 
	ifeq L8
	
        ;; If true then do: 
	
        ;; void printBool (bool true);
	iconst_1
	invokestatic core017/printBool(Z)V
	nop
	goto L7
	
        ;; If false then do: 
	L8:
	L7:
	
        ;; void printBool (bool (bool eq_bool (bool true, bool true)) || (bool dontCallMe (int 1)));
	iconst_1
	iconst_1
	iconst_1
	invokestatic core017/eq_bool(ZZ)Z
	iconst_1
	if_icmpeq  L15
	iconst_1
	invokestatic core017/dontCallMe(I)Z
	iconst_1
	if_icmpeq  L15
	pop
	iconst_0
	L15:
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool (int 4) > (int 50)) && (bool dontCallMe (int 2)));
	iconst_0
	iconst_4
	bipush 50
	if_icmpgt  L17
	iconst_0
	goto L18
	L17:
	iconst_1
	L18:
	iconst_0
	if_icmpeq  L16
	iconst_2
	invokestatic core017/dontCallMe(I)Z
	iconst_0
	if_icmpeq  L16
	pop
	iconst_1
	L16:
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool (bool (bool (int 4) == (int x)) && (bool eq_bool (bool true, bool false))) && (bool true));
	iconst_0
	iconst_0
	iconst_4
	iload_0
	if_icmpeq  L21
	iconst_0
	goto L22
	L21:
	iconst_1
	L22:
	iconst_0
	if_icmpeq  L20
	iconst_1
	iconst_0
	invokestatic core017/eq_bool(ZZ)Z
	iconst_0
	if_icmpeq  L20
	pop
	iconst_1
	L20:
	iconst_0
	if_icmpeq  L19
	iconst_1
	iconst_0
	if_icmpeq  L19
	pop
	iconst_1
	L19:
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool implies (bool false, bool false));
	iconst_0
	iconst_0
	invokestatic core017/implies(ZZ)Z
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool implies (bool false, bool true));
	iconst_0
	iconst_1
	invokestatic core017/implies(ZZ)Z
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool implies (bool true, bool false));
	iconst_1
	iconst_0
	invokestatic core017/implies(ZZ)Z
	invokestatic core017/printBool(Z)V
	nop
	
        ;; void printBool (bool implies (bool true, bool true));
	iconst_1
	iconst_1
	invokestatic core017/implies(ZZ)Z
	invokestatic core017/printBool(Z)V
	nop
	
        ;; return int 0;
	iconst_0
	ireturn

.end method

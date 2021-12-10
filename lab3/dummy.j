.class public dummy
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

  invokestatic dummy/main()I
  pop
  return

.end method


.method public static foo()V
  .limit locals 0
  .limit stack 0

        return

.end method

.method public static main()I
  .limit locals 0
  .limit stack 1

	
        ;; void foo ();
	invokestatic dummy/foo()V
	nop
	
        ;; return int 5050;
	ldc 5050
	ireturn

.end method

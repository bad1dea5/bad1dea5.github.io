---
layout: default
title: Introduction to AArch64 assembly
date: 2020-12-30
categories: [assembly]
tags: [none]
---
## {{ page.title }}

The architecture provides 31 general purpose registers. Each register can be used as a 64-bit `x` register (`x0..x30`),
or as a 32-bit `w` register (`w0..w30`). When a `w` register is written, 
the top 32 bits of the 64-bit register are zeroed.

There is a separate set of 32 registers used for floating point and vector operations. These registers are 128-bit, 
but like the general-purpose registers, can be accessed in several ways. `Bx` is 8 bits, `Hx` is 16 bits, 
`Sx` is 32 bits, `Dx` is 64 bits and `Qx` is 128 bits.

These registers can also be referred to as `v` registers. When the `v` form is used, the register is treated as being 
a vector. This means that it is treated as though it contains multiple independent values, instead of a single value.

The zero registers, `xzr` and `wzr`, always read as 0 and ignore writes.

You can use the stack pointer (`sp`) as the base address for loads and stores. You can also use the stack pointer with 
a limited set of data-processing instructions, but it is not a regular general purpose register.

`x30` is used as the Link Register and can be referred to as `lr`.

The Program Counter (`pc`) is not a general-purpose register in A64, and it cannot be used with data processing 
instructions.

### Procedure Call Standard

- The first seven arguments go in `x0..x7`.
- Any further arguments are passed on the stack.
- In C++, `x0` is used to pass the implicit this pointer that points to the called function.
- The registers `x0` to `x15` are considered volatile (caller-saved).
- The registers `x19` to `x28` are considered nonvolatile (callee-saved).
- `xr` is an indirect result register.
- `ip0` and `ip1` are intra-procedure-call corruptible registers.
- `fp` frame pointer.

### System Calls

There are special instructions for making such system calls. These instructions cause an exception, which allows 
controlled entry into a more privileged Exception level.

- `svc` Supervisor call - Causes an exception targeting `EL1`.
- `hvc` Hypervisor call - Causes an exception targeting `EL2`.
- `smc` Secure monitor call - Causes an exception targeting `EL3`.

<div class="flex">
<div class="full half-600">
<div markdown="1">
**Linux**
`svc #0` using `w8` for the system call number, and `x0` and `x1` for the result.
</div>
</div>
<div class="full half-600">
<div markdown="1">
{% highlight armasm %}
mov	x0, #0
mov	x8, #93
svc	#0
{% endhighlight %}
</div>
</div>
</div>

<div class="flex">
<div class="full half-600">
<div markdown="1">
**Windows**
`svc n` where `n` is the system call number. `x0` and `x1` for the result.
</div>
</div>
<div class="full half-600">
<div markdown="1">
{% highlight armasm %}
svc	7
ret
{% endhighlight %}
</div>
</div>
</div>

### Reference

- [AArch64 Instruction Set Architecture](https://developer.arm.com/architectures/learn-the-architecture/aarch64-instruction-set-architecture 
"AArch64 Instruction Set Architecture")
- [AArch64 Instruction Set PDF](https://static.docs.arm.com/100898/0100/the_a64_Instruction_set_100898_0100.pdf 
"AArch64 Instruction Set PDF")
- [Arm Architecture Reference Manual Armv8](https://developer.arm.com/documentation/ddi0487/fc/
"Arm Architecture Reference Manual Armv8")
- [Microsoft ARM assembler (armasm) Reference](https://docs.microsoft.com/en-us/cpp/assembler/arm/arm-assembler-reference?view=msvc-160
"Microsoft ARM assembler &#40;armasm&#41; Reference")

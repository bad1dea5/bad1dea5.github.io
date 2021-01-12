---
layout: default
title: Introduction to AArch64 assembly
date: 2020-12-30
categories: [assembly]
tags: [none]
---
<h2>{{ page.title }}</h2>

<p>
	The architecture provides 31 general purpose registers. Each register can be used as a 64-bit <code>x</code> 
	register (<code>x0..x30</code>), or as a 32-bit <code>w</code> register (<code>w0..w30</code>). 
	When a <code>w</code> register is written, the top 32 bits of the 64-bit register are zeroed. 
	<br><br>
	There is a separate set of 32 registers used for floating point and vector operations. These registers are 128-bit,
	but like the general-purpose registers, can be accessed in several ways. <code>Bx</code> is 8 bits, <code>Hx</code> 
	is 16 bits, <code>Sx</code> is 32 bits,	<code>Dx</code> is 64 bits and <code>Qx</code> is 128 bits.
	These registers can also be referred to as <code>v</code> registers. When the <code>v</code> form is used, the 
	register is treated as being a vector. This means that it is treated as though it contains multiple independent 
	values, instead of a single value.
	<br><br>
	The zero registers, <code>xzr</code> and <code>wzr</code>, always read as 0 and ignore writes.
	<br><br>
	You can use the stack pointer (<code>sp</code>) as the base address for loads and stores. You can also use the 
	stack pointer with a limited set of data-processing instructions, but it is not a regular general purpose register.
	<br><br>
	<code>x30</code> is used as the Link Register and can be referred to as <code>lr</code>.
	<br><br>
	The Program Counter (<code>pc</code>) is not a general-purpose register in A64, and it cannot be used with data 
	processing instructions.
</p>

<h3>Procedure Call Standard</h3>

<ul>
	<li>The first seven arguments go in <code>x0..x7</code>.</li>
	<li>Any further arguments are passed on the stack.</li>
	<li>In C++, <code>x0</code> is used to pass the implicit this pointer that points to the called function.</li>
	<li>The registers <code>x0</code> to <code>x15</code> are considered volatile (caller-saved).</li>
	<li>The registers <code>x19</code> to <code>x28</code> are considered nonvolatile (callee-saved).</li>
	<li><code>xr</code> is an indirect result register</li>
	<li><code>ip0</code> and <code>ip1</code> are intra-procedure-call corruptible registers.</li>
	<li><code>fp</code> frame pointer.</li>
</ul>

<h3>System Calls</h3>

<p>
	There are special instructions for making such system calls. These instructions cause an exception, 
	which allows controlled entry into a more privileged Exception level.
</p>

<ul>
	<li><code>svc</code> Supervisor call - Causes an exception targeting <code>EL1</code></li>
	<li><code>hvc</code> Hypervisor call - Causes an exception targeting <code>EL2</code></li>
	<li><code>smc</code> Secure monitor call - Causes an exception targeting <code>EL3</code></li>
</ul>

<div class="flex">
	<div class="full half-600">
		<h4>Linux</h4>
		<code>svc #0</code> using <code>w8</code> for the system call number, and <code>x0</code> and <code>x1</code> for the result.
	</div>
	<div class="full half-600">
{% highlight armasm %}
mov	x0, #0
mov	x8, #93
svc	#0
{% endhighlight %}
	</div>
</div>

<div class="flex">
	<div class="full half-600">
		<h4>Windows</h4>
		<code>svc n</code> where <code>n</code> is the system call number. <code>x0</code> and <code>x1</code> for the result.
	</div>
	<div class="full half-600">
{% highlight armasm %}
svc	7
ret
{% endhighlight %}
	</div>
</div>

<h3>References</h3>

<a class="stack" 
	href="https://developer.arm.com/architectures/learn-the-architecture/aarch64-instruction-set-architecture">
	AArch64 Instruction Set Architecture
</a>
<a class="full" href="https://developer.arm.com/documentation/ddi0487/fc/">Arm Architecture Reference Manual Armv8</a>
<a class="stack" href="https://static.docs.arm.com/100898/0100/the_a64_Instruction_set_100898_0100.pdf">
	The AArch64 Instruction set
</a>
<a class="stack" href="https://docs.microsoft.com/en-us/cpp/assembler/arm/arm-assembler-reference?view=msvc-160">
	 Microsoft ARM assembler (armasm) Reference
</a>

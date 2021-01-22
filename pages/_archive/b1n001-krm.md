---
layout: default
title: B1N001-KRM
section: Note
---
## {{ page.title }}

### Extern

**as**

> **7.33 .extern**
`.extern` is accepted in the source program—for compatibility with other assemblers—but it is ignored. as treats all 
undefined symbols as external.

**nasm**

> **7.5 EXTERN: Importing Symbols from Other Modules**
`EXTERN` is similar to the MASM directive `EXTRN` and the C keyword `extern`: it is used to declare a symbol which is 
not defined anywhere in the module being assembled, but is assumed to be defined in some other module and needs to be 
referred to by this one.



<div class="flex one two-800">
	<div markdown="1">
   **as**
   ```nasm
.extern dlopen
.global _start

.text
	_start:
		xor		%rbp, %rbp
		mov		%rax, %rdi
		mov		$60, %rax
		syscall
		hlt
   ```
</div>
<div markdown="1">
   **nasm**
   ```nasm
extern dlopen
global _start

section .text
	_start:
		xor		rbp, rbp
		mov		rdi, rax
		mov		rax, 60
		syscall
		hlt
   ```
</div>
</div>

`0x0000000000000001 (NEEDED)             Shared library: [libdl.so.6]`

`nasm` will automatically pull in the module needed, whereas `as` needs a `call` to the function. Example
`call dlopen`.

---
layout: default
title: x86 opcode and instruction reference
section: x86_64
---
## {{ page.title }}


### Instructions

An x86 instruction statement can consist of four parts:

- Label (optional) `foobar:`
- Instruction (required) `mov`
- Operands (instruction specific) `r16/32/64`
- Comment (optional) `;`

### JMP

```nasm
EB 63                jmp         Func+6Bh (07FF7AB6B210Dh)   ; jmp rel8
E9 90 00 00 00       jmp         Func+9Bh (07FF7EF49213Dh)   ; jmp rel32
```

**Short jump** [2 bytes] `EB` A jump where the jump range is limited to –128 to +127 from the 
current EIP value.

**Near jump** [5 bytes] `E9` A jump to an instruction within the current code segment 
(the segment currently pointed to by the CS register).

### LEA

Load effective address `r16/32/64`, using opcode `8D`

```nasm
;00007FF700000000	0000000000001000 ; rbx

lea rax, rbx

; rax = 00007FF700000000
```

### SHR

Shift right, opcodes `C0 C1 D0 D1 D2 D3` depending on operand. <span class="label warning">Verifying</span>

```nasm
; 0x000055555555563e 48 b9 ef cd ab 90 78 56 34 12    movabs  $0x1234567890abcdef,%rcx
; 0x0000555555555648 48 c1 e9 20                      shr     $0x20,%rcx

mov rcx, 0x1234567890abcdef
shr rcx, 32

; rcx = 0x1234567890abcde
; rcx = 0x12345678
```

### Reference
- [ref.x86asm.net](http://ref.x86asm.net/)


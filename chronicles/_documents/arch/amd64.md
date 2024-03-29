---
layout: post
title:  "AMD64"
date:   2024-01-23 20:36:54 +0000
categories: asm amd64
---

x86-64 (also known as __x64__, __x86_64__, __AMD64__, and __Intel 64__) is a 64-bit version of the x86 instruction set.

- [AMD64 Architecture Programmer’s Manual](https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf)

### Registers
{: .py-2 }

- There are sixteen general-purpose registers, and the lower 32 bits, 16 bits, and 8 bits of each register are addressable.
- The higher 8 bits of `rax`, `rbx`, `rcx` and `rdx` can be referred to as, `ah`, `bh`, `ch` and `dh`.
- Eight 80-bit floating point `FPRn` which are overlaid with 64-bit MMX registers `MMXn`. 
- Sixteen 128-bit XMM registers `XMMn`.
- A 64-bit `RFLAGS` register. The higher 32 bits of `RFLAGS` are reserved and unused.
- A 64-bit `rip` register.
- The segment registers `cs`, `fs` and `gs`.
- `rax`, `rcx`, `rdx`, `rbx`, `rdi`, `rsi`, `rbp`, `rsp` are aliases to registers `r0` to `r7`.
- `rax`, `rcx`, `rdx`, `r8`, `r9`, `r10`, `r11` are considered volatile (caller-saved).
- `rbx`, `rdi`, `rsi`, `rbp`, `rsp`, `r12`, `r13`, `r14`, and `r15` are considered nonvolatile (callee-saved).

{: .table .table-sm .small }
| 64 | 32 | 16 | 8L | 8H | Description |
| --- | --- | --- | --- | --- | :---: |
| `rax` | `eax` | `ax` | `al` | `ah` | Accumulator |
| `rbx` | `ebx` | `bx` | `bl` | `bh` | Base |
| `rcx` | `ecx` | `cx` | `cl` | `ch` | Count |
| `rdx` | `edx` | `dx` | `dl` | `dh` | I/O address |
| `rsi` | `esi` | `si` | `sil` | | Source index |
| `rdi` | `edi` | `di` | `dil` | | Destination index |
| `rbp` | `ebp` | `bp` | `bpl` | | Base pointer |
| `rsp` | `esp` | `sp` | `spl` | | Stack pointer |
| `r8` | `r8d` | `r8w` | `r8b` | | |
| `r9` | `r9d` | `r9w` | `r9b` | | |
| `r10` | `r10d` | `r10w` | `r10b` | | |
| `r11` | `r11d` | `r11w` | `r11b` | | |
| `r12` | `r12d` | `r12w` | `r12b` | | |
| `r13` | `r13d` | `r13w` | `r13b` | | |
| `r14` | `r14d` | `r14w` | `r14b` | | |
| `r15` | `r15d` | `r15w` | `r15b` | | |
| `rip` | `eip` | `ip` | | | Instruction Pointer |
| `RFLAGS` | `EFLAGS` | `FLAGS` | | |

### RFLAGS Register
{: .py-2 }

The RFLAGS register stores flags used for results of operations and for controlling the processor.

{: .table .table-sm .small }
| Mnemonic | Bit | Name | Description |
| --- | --- | --- | :---: |
| `CF` | 0 | Carry | Operation generated a carry or borrow |
| `PF` | 2 | Parity | Last byte has even number of 1's, else 0 |
| `AF` | 4 | Adjust | Denotes binary coded decimal in-byte carry |
| `ZF` | 6 | Zero | Result was 0 |
| `SF` | 7 | Sign | Most significant bit of result is 1 |
| `OF` | 11 | Overflow | Overflow on signed operation |
| `DF` | 10 | Direction | Direction string instructions operate (increment or decrement) |
| `ID` | 21 | Identification | Changeability denotes presence of `cpuid` instruction |

### Application Binary Interface
{: .py-2 }

- [Application Binary Interface](https://raw.githubusercontent.com/wiki/hjl-tools/x86-psABI/x86-64-psABI-1.0.pdf)
- [Overview of x64 ABI conventions](https://learn.microsoft.com/en-us/cpp/build/x64-software-conventions?view=msvc-170)

__Linux__

- In user-level applications, the first six integer or pointer arguments are passed in registers `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`.
- In kernel mode the interface is `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9`.
- Integer return values up to 64 bits in size are stored in `rax`, while values up to 128 bit are stored in `rax` and `rdx`.
- The number of the syscall has to be passed in register `rax`.
- A system-call is done via the `syscall` instruction. The kernel destroys registers `rcx` and `r11`.
- Returning from the `syscall`, register `rax` contains the result of the system-call. A value in the range between 
`-4095` and `-1` indicates an error, it is `-errno`.
- The stack pointer `rsp` must be aligned to a 16-byte boundary before making a call.

__Windows__

- In user-level applications, the first four integer or pointer arguments are passed in registers `rcx`, `rdx`, `r8`, `r9`.
- In kernel mode the interface is `r10`, `rdx`, `r8`, `r9`.
- For floating point arguments, the first four arguments are passed in registers `xmm0`, `xmm1`, `xmm2`, `xmm3`.
- Additional arguments are pushed on the stack left to right.
- It is the caller’s responsibility to allocate 32 bytes of “shadow space” (for storing `rcx`, `rdx`, `r8`, `r9` if needed) before calling a function.
- It is the caller’s responsibility to clean the stack after a call.
- The stack is 16-byte aligned. The call instruction pushes an 8-byte return value, All non-leaf functions must adjust the stack by a value of the form 16n+8 when allocating stack space.

#### Jump
{: .py-2 }

The jump instructions allow the programmer to (indirectly) set the value of the `rip` register, with
all of the jump instructions, with the exception of `jmp`, being conditional jumps.

{: .table .table-sm .small }
| Mnemonic | Signage | Flags | Description |
| --- | --- | --- | :---: |
| `jmp` | | | Unconditional jump |
| `jo` | | `OF` = 1 | Jump of overflow |
| `jno` | | `OF` = 0 | Jump of not overflow |
| `js` | | `SF` = 1 | Jump if signed |
| `jns` | | `SF` = 0 | Jump if not signed |
| `je` | | `ZF` = 1 | Jump if equal |
| `jz` | | `ZF` = 1 | Jump if zero |
| `jne` | | `ZF` = 0 | Jump if not equal |
| `jnz` | | `ZF` = 0 | Jump if not zero |
| `jb` | unsigned | `CF` = 1 | Jump if below |
| `jnae` | unsigned | `CF` = 1 | Jump if not above or equal |
| `jc` | unsigned | `CF` = 1 | Jump if carry |
| `jnb` | unsigned | `CF` = 0 | Jump if not below |
| `jae` | unsigned | `CF` = 0 | Jump if above or equal |
| `jnc` | unsigned | `CF` = 0 | Jump if not carry |
| `jbe` | unsigned | `CF` = 1 or `ZF` = 1 | Jump if below or equal |
| `jna` | unsigned | `CF` = 1 or `ZF` = 1 | Jump if not above |
| `ja` | unsigned | `CF` = 0 and `ZF` = 0 | Jump if above |
| `jnbe` | unsigned | `CF` = 0 and `ZF` = 0 | Jump if not below or equal |
| `jl` | signed | `SF` <> `OF` | Jump if less |
| `jnge` | signed | `SF` <> `OF` | Jump if not greater or equal |
| `jge` | signed | `SF` = `OF` | Jump if greater or equal |
| `jnl` | signed | `SF` = `OF` | Jump if not less |
| `jle` | signed | `SF` <> `OF` or `ZF` = 1 | Jump if less or equal |
| `jng` | signed | `SF` <> `OF` or `ZF` = 1 | Jump if not greater |
| `jg` | signed | `SF` = `OF` and `ZF` = 0 | Jump if greater |
| `jnle` | signed | `SF` = `OF` and `ZF` = 0 | Jump if not less or equal |
| `jp` | | `PF` = 1 | Jump if parity |
| `jpe` | | `PF` = 1 | Jump if parity even |
| `jnp` | | `PF` = 0 | Jump if not parity |
| `jpo` | | `PF` = 0 | Jump if parity odd |
| `jcxz` | | `cx` = 0 | Jump if counter register is zero |
| `jecxz` | | `ecx` = 0 | Jump if counter register is zero |
| `jrcxz` | | `rcx` = 0 | Jump if counter register is zero |

#### Move
{: .py-2 }

{: .table .table-sm .small }
| Mnemonic | Description |
| --- | :---: |
| `mov`    | |
| `movzbw` | Byte to word; zero-extended. |
| `movzbl` | Byte to long; zero-extended. |
| `movzwl` | Word to long; zero-extended. |
| `movsxd` | Word to long; sign-extension. |

#### Test
{: .py-2 }

The `test` instruction performs a bitwise AND on two operands.

- The flags `SF`, `ZF`, `PF` are modified while the result of the AND is discarded.
- The `OF` and `CF` flags are set to 0, while `AF` flag is undefined.
- The `test` operation clears the flags `CF` and `OF` to zero.
- The `SF` is set to the most significant bit of the result of the AND. If the result is 0, the `ZF` is set to 1, otherwise set to 0.

{% highlight nasm %}
test    %al, %al            ; set ZF to 1 if al == 0
jz      foo                 ; jump if ZF == 1

test    %al, %al            ; set ZF to 1 if al == 0
jnz     foo                 ; jump if ZF == 0

test    %eax, %eax          ; set SF to 1 if eax < 0
js      foo                 ; jump if SF == 1
{% endhighlight %}

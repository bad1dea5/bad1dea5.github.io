---
layout: post
title:  "Gnu Assembler"
date:   2024-01-23 16:57:33 +0000
categories: asm
---

The GNU Assembler, commonly known as `gas` or `as`, is the assembler developed by the GNU Project. 
It is the default back-end of GCC, and is part of the GNU Binutils package. 
The default syntax for `as` is AT&amp;T, but it can be used with Intel syntax by using the `.intel_syntax` directive.

- [assembler](https://sourceware.org/binutils/docs-2.38/as/)
- [linker](https://sourceware.org/binutils/docs/ld/)

### Program
{: .py-2 }

{% highlight nasm %}
.global _start

.text
    _start:
        xor     %rbp, %rbp
        sub     $0x20, %sp
        
        add     $0x20, %sp

        xor     %edi, %edi
        mov     $231, %ax
        syscall
        hlt
{% endhighlight %}

{% highlight terminal %}
as -c program.s
ld program.o
{% endhighlight %}

### BSS Segment
{: .py-2 }

The BSS segment contains uninitialized static data, both variables and constants,
i.e. global variables and local static variables that are initialized to zero or do
not have explicit initialization in source code.

{% highlight nasm %}
.bss
    .comm foo, 8
    .lcomm bar, 8
{% endhighlight %}

### DATA Segment
{: .py-2 }

The data segment contains initialized static variables, that is, global variables and static local variables. 
The data segment is read/write, since the values of variables can be altered at run time.

{% highlight nasm %}
.data
    foo: .ascii "BAD1DEA5"
    bar: .octa 0xbad1dea5
{% endhighlight %}

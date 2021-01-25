---
layout: default
title: AT&amp;T vs. Intel syntax
date: 2021-01-05
categories: [assembly]
tags: [none]
---
## {{ page.title }}

|   | AT&amp;T | Intel |
| ------------ | :------------: | :------------: |
| Comments | `//` | `;` |
| Instructions | `addq` | `add` |
| Order | `mov $1, %rax` source, dest | `mov rax, 1` dest, source |
| Registers | `%rax` | `rax`  |
| Immediates | `$0x100` | `0x100` |
| Indirect | `(%rax)` | `[rax]` |
| General indirect | displacement(reg, reg, scale) | [base + reg + reg * scale + displacement] |


### Particulars

<div class="flex">
<div class="full half-600">
<div markdown="1">

**AT&amp;T**

The size of the memory operands, is determined from the from the last character of the instruction mnemonic.

- `b` byte		(8-bit)
- `w` word		(16-bit)
- `l` long		(32-bit)
- `q` qword		(64-bit)

{% highlight nasm %}movb foo, %al{% endhighlight %}
{% highlight nasm %}movb 8(%rbx, %rcx), %rax{% endhighlight %}

</div>
</div>
<div class="full half-600">
<div markdown="1">

**Intel**

Intel syntax accomplishes this by prefixing memory operands (not the instruction mnemonics).

- `byte ptr` byte			(8-bit)
- `word ptr` word			(16-bit)
- `dword ptr` long		(32-bit)
- `qword ptr` qword		(64-bit)

{% highlight nasm %}mov al, byte ptr foo{% endhighlight %}
{% highlight nasm %}mov byte rax, [rbx+rcx+8]{% endhighlight %}

</div>
</div>
</div>


### Immediate form long jumps and calls
	
<div class="flex">
	<div class="full half-600">
<div markdown="1">

{% highlight nasm %}lcall/ljmp $section, $offset{% endhighlight %}
{% highlight nasm %}lret $stack-adjust{% endhighlight %}

</div>
	</div>
	<div class="full half-600">
<div markdown="1">

{% highlight nasm %}call/jmp far section:offset{% endhighlight %}
{% highlight nasm %}ret far stack-adjust{% endhighlight %}

</div>
	</div>
</div>

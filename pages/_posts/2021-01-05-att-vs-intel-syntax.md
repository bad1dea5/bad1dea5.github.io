---
layout: default
title: AT&amp;T vs. Intel syntax
date: 2021-01-05
categories: [assembly]
tags: [none]
---
<h2>{{ page.title }}</h2>

<table class="">
	<thead>
		<tr>
			<th></th>
			<th>AT&amp;T</th>
			<th>Intel</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Comments</td>
			<td><code>//</code></td>
			<td><code>;</code></td>
		</tr>
		<tr>
			<td>Instructions</td>
			<td><code>addq</code></td>
			<td><code>add</code></td>
		</tr>
		<tr>
			<td>Order</td>
			<td><code>mov $1, %rax</code> source, dest</td>
			<td><code>mov rax, 1</code> dest, source</td>
		</tr>
		<tr>
			<td>Registers</td>
			<td><code>%rax</code></td>
			<td><code>rax</code></td>
		</tr>
		<tr>
			<td>Immediates</td>
			<td><code>$0x100</code></td>
			<td><code>0x100</code></td>
		</tr>
		<tr>
			<td>Indirect</td>
			<td><code>(%rax)</code></td>
			<td><code>[rax]</code></td>
		</tr>
		<tr>
			<td>General indirect</td>
			<td>
				<code>displacement(reg, reg, scale)</code><br>
			</td>
			<td>
				<code>[base + reg + reg * scale + displacement]</code>
			</td>
		</tr>
	</tbody>
</table>

<div class="flex">
	<div class="full half-600">
		<h4>AT&amp;T</h4>

		The size of the memory operands, is determined from the from the last character of the instruction mnemonic.
		
		<ul>
			<li><code>b</code> byte (8-bit)</li>
			<li><code>w</code> word (16-bit)</li>
			<li><code>l</code> long (32-bit)</li>
			<li><code>q</code> qword (64-bit)</li>
		</ul>
		{% highlight nasm %}movb foo, %al{% endhighlight %}
		{% highlight nasm %}movb 8(%rbx, %rcx), %rax{% endhighlight %}
	</div>
	<div class="full half-600">
		<h4>Intel</h4>

		 Intel syntax accomplishes this by prefixing memory operands (not the instruction mnemonics).
		 
		 <ul>
			<li><code>byte ptr</code> byte (8-bit)</li>
			<li><code>word ptr</code> word (16-bit)</li>
			<li><code>dword ptr</code> long (32-bit)</li>
			<li><code>qword ptr</code> qword (64-bit)</li>
		</ul>
		{% highlight nasm %}mov al, byte ptr foo{% endhighlight %}
		{% highlight nasm %}mov byte rax, [rbx+rcx+8]{% endhighlight %}
	</div>
	
	<h5>Immediate form long jumps and calls</h5>
	
	<div class="flex">
	<div class="full half-600">
		{% highlight nasm %}lcall/ljmp $section, $offset{% endhighlight %}
		{% highlight nasm %}lret $stack-adjust{% endhighlight %}
	</div>
	<div class="full half-600">
		{% highlight nasm %}call/jmp far section:offset{% endhighlight %}
		{% highlight nasm %}ret far stack-adjust{% endhighlight %}
	</div>
</div>

### Reference
[(Gnu)as Maunal](https://sourceware.org/binutils/docs/as/index.html "(Gnu)as Maunal")
[NASM Manual](https://nasm.us/docs.php "NASM Manual")

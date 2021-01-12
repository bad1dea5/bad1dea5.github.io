---
layout: default
title: <BAD1DEA5>
---
<article class="card">
	<p>
		{{ site.description }}
	</p>
</article>

<div class="py-4">
	<span class="stack">
		<a href="/documentation">Documentation</a>
		<span class="label label-fw" style="float:right">Directory</span>
	</span>
</div>

<table class="">
	<tbody>
	{% for post in site.posts %}
	<tr>
		<td class="p-0">
			<a href="{{ post.url }}">{{ post.title }}</a>
			<span class="label label-fw" style="float:right">{{ post.categories[0] | capitalize }}</span>
		</td>
	</tr>	
	{% endfor %}
	</tbody>
</table>

---
layout: default
title: Documentation
permalink: /documentation
---
<h2>{{ page.title }}</h2>

<div class="py-4">
	{% for item in site.private %}
	<span class="stack">
		<a href="{{ item.url }}">{{ item.title }}</a>
		<span class="label label-fw error" style="float:right">{{ item.collection | capitalize }}</span>
	</span>
	{% endfor %}
</div>

<table class="">
	<tbody>
	{% for item in site.data.source %}
	<tr>
		<td class="p-0">
			<a href="{{ item.url }}">{{ item.title }}</a>
			<span class="label label-fw" style="float:right">{{ item.language | capitalize }}</span>
		</td>
	</tr>	
	{% endfor %}
	</tbody>
</table>

<div class="pt-4">
	<table class="">
		<tbody>
		{% for item in site.archive %}
		<tr>
			<td class="p-0">
				<a href="{{ item.url }}">{{ item.title }}</a>
				<span class="label label-fw" style="float:right">{{ item.section | capitalize }}</span>
			</td>
		</tr>	
		{% endfor %}
		</tbody>
	</table>
</div>

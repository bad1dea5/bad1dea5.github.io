---
layout: default
title: KRAMPUS
category: private
---
<h2>{{ page.title }}</h2>

<h3><span class="label">Version: 1.0</span></h3>

<a href="https://github.com/bad1dea5/KRAMPUS" class="pseudo button">
	<i class="fas fa-fw fa-external-link-alt"></i>
</a>

<article class="card">
	<header class="p-0">
		<table>
			<thead>
				<tr>
					<th></th>
					<th>AArch64</th>
					<th>x86_64</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Android</td>
					<td>:heavy_check_mark:</td>
					<td>:x:</td>
				</tr>
				<tr>
					<td>Linux</td>
					<td>:heavy_check_mark:</td>
					<td>:heavy_check_mark:</td>
				</tr>
				<tr>
					<td>Windows</td>
					<td>:heavy_check_mark:</td>
					<td>:heavy_check_mark:</td>
				</tr>
			</tbody>
		</table>
	</header>
</article>

<section>
	<h3>Prerequisite</h3>
	
	<h5>Android</h5>

	<ul>
		<li>CMake >= 3.16</li>
		<li>Java JDK >= 11.0.9</li>
		<li>Gradle >= 6.7.1</li>
		<li>Android NDK == r21d</li>
		<li>Android SDK == API 29</li>
	</ul>
	
	<ol>
		<li>Install Java JDK</li>
		<li>Extract gradle to <code>{root}/Tools/gradle</code></li>
		<li>Extract Android NDK to <code>{root}/Source/SDK/Android/NDK</code></li>
		<li>Extract Android SDK to <code>{root}/Source/SDK/Android/SDK</code></li>
		<li>
			Run <code>sdkmanager --sdk_root={root}/Source/SDK/Android/SDK "platform-tools" "platforms;android-29"</code>
		</li>
	</ol>

	<h5>Linux</h5>
	
	<ul>
		<li>GCC >= 9.3.0</li>
		<li>CMake >= 3.16</li>
		<li>Make >= 4.2.1</li>
	</ul>

	<h5>Windows</h5>
	
	<ul>
		<li>Visual Studio 2019</li>
		<li>CMake => 3.16</li>
	</ul>
	
	<p>If your building for Windows AArch64, you also need:</p>
	
	<ul>
		<li>Ninja >= 1.8.2</li>
		<li>ARM64 Toolset</li>
	</ul>
</section>

<section>
	<h3>Building</h3>
	
	<dl>
		<dt><h5>Android</h5></dt>
			<dd><code>Build.Android.Linux.sh</code> for Android build on Linux</dd>
			<dd><code>Build.Android.Windows.ps1</code> for Android build on Windows</dd>
		<dt><h5>Linux</h5></dt>
			<dd><code>Build.Linux.sh</code></dd>
		<dt><h5>Windows</h5></dt>
			<dd><code>Build.Windows.ps1</code></dd>
	</dl>
	
	<p>
		The binaries can be found in <code>{root}/build/{os}/{arch}</code>. For example
		<code>{root}/build/Linux/x86_64</code>
	</p>
</section>

<section>
	<h3>Files</h3>

	<div class="collapsible">
		<label class="stack button toggle" for="builder">
			<i class="fas fa-fw fa-file-code"></i>
			<span>Builder</span>
		</label>
		<input type="checkbox" id="builder" />
		<div>
			<pre><code>TODO</code></pre>
		</div>
		<label class="stack button toggle" for="launcher">
			<i class="fas fa-fw fa-file-code"></i>
			<span>Launcher</span>
		</label>
		<input type="checkbox" id="launcher" />
		<div>
			<pre><code>TODO</code></pre>
		</div>
	</div>
</section>

<section>
	<h4>Plugins</h4>

	<div>
		<pre><code>TODO</code></pre>
	</div>
</section>

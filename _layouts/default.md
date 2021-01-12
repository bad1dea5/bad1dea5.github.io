<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="{{ '/assets/css/default.css' | relative_url }}" />
		<title>{{ page.title }}</title>
	</head>
	<body>
		<nav>
			<a href="/" class="brand">
				<img class="logo" src="/assets/img/icon.svg" />
				<span>BAD1DEA5</span>
			</a>
			<input id="bmenub" type="checkbox" class="show">
			<label for="bmenub" class="burger pseudo button">
				<i class="fas fa-fw fa-bars"></i>
			</label>
			<div class="menu">
				<a href="/about" class="pseudo button">
					<i class="far fa-fw fa-life-ring"></i>
				</a>
				<a href="https://github.com/bad1dea5" class="pseudo button">
					<i class="fab fa-fw fa-github-alt"></i>
				</a>
			</div>
		</nav>
		<main>
			{{ content }}
		</main>
	</body>
</html>



<html lang="en">
<head>
<title>Pragnya</title>
<script src="https://cdn.tailwindcss.com">
	
</script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<style>
.logo-img {
	transform: rotate(180deg);
}
</style>
</head>
<body>
	<header class="bg-white shadow">
		<div class="container mx-auto p-4 flex justify-between items-center">
			<div class="flex items-center space-x-4">
				<img alt="Pragnya logo with a stylized book and graduation cap"
					class="logo-img" height="50" src="pragya.png" width="50" />
				<h1 class="text-2xl font-bold">Pragnya</h1>
			</div>
			<nav class="hidden md:flex space-x-4 items-center">
				<a class="text-gray-700 hover:text-blue-500" href="#welcome">
					Home </a> <a class="text-gray-700 hover:text-blue-500" href="#about">
					About Us </a> <a class="text-gray-700 hover:text-blue-500"
					href="#popular-courses"> Popular Courses </a> <a
					class="text-gray-700 hover:text-blue-500" href="#feedback">
					Feedback </a>
				<div class="relative">
					<input class="border border-gray-300 rounded-lg px-4 py-2"
						placeholder="Explore..." type="text" />
					<button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
						<i class="fas fa-search"> </i>
					</button>
				</div>
				<div class="relative">
					<a href="logout.jsp"
						class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 flex items-center">
						<i class="fas fa-sign-out-alt mr-2"></i> Logout
					</a>
				</div>
			</nav>
			<div class="md:hidden">
				<button class="text-gray-700 hover:text-blue-500"
					id="mobile-menu-button">
					<i class="fas fa-bars"> </i>
				</button>
			</div>
		</div>
		<div class="hidden bg-white shadow-lg" id="mobile-menu-dropdown">
			<nav class="space-y-2 p-4">
				<a class="block text-gray-700 hover:text-blue-500" href="#welcome">
					Home </a> <a class="block text-gray-700 hover:text-blue-500"
					href="#about"> About Us </a> <a
					class="block text-gray-700 hover:text-blue-500"
					href="#popular-courses"> Popular Courses </a> <a
					class="block text-gray-700 hover:text-blue-500" href="#feedback">
					Feedback </a>
				<div class="relative">
					<input class="border border-gray-300 rounded-lg px-4 py-2 w-full"
						placeholder="Explore..." type="text" />
					<button class="absolute right-0 top-0 mt-2 mr-2 text-gray-500">
						<i class="fas fa-search"> </i>
					</button>
				</div>
				<button
					class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 w-full">
					Logout</button>
			</nav>
		</div>
	</header>
	<script>
		document.getElementById('mobile-menu-button').addEventListener('click',
				function() {
					var menu = document.getElementById('mobile-menu-dropdown');
					if (menu.classList.contains('hidden')) {
						menu.classList.remove('hidden');
					} else {
						menu.classList.add('hidden');
					}
				});
	</script>
</body>
</html>

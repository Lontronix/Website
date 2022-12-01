<script>
	export let color;
	
	const possibilities = [
		"Fish Keeper",
		"Apple Fan",
		"Capybara Lover",
		"The West Wing Enjoyer",
		"Professional Boyfriend",
		"Cyclist",
		"Avid Runner",
		"Tim",
		"Computer Scientist"
	];
	
	function getRandomPossibility() {
		return possibilities[Math.floor(Math.random() * possibilities.length)];
	}
	
</script>

<div class="header">
	<h1 style="color:{color};">Lonnie Gerol</h1>
	<p>// Developer, Student, {getRandomPossibility()}</p>
</div>

<style>
.header {
	margin: auto;
	font-size: 18px;
	text-align: center;
}	
</style>
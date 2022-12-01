<script>
export let experience = {
	company: "Apple",
	jobTitle: "Software Engineering Intern",
	photoSrc: "src/assets/bryx.jpg"
}

export let accentColor = "#FFFFFF";
</script>

<div class="experience-card">
	<img
		src={experience.photoSrc}
		alt={`${experience.company}'s logo`}
		width=100px height=100px>
	<h3 style="color: {accentColor};"> {experience.company} | {experience.jobTitle}</h3>
	<slot/>
</div>

<style>

	img {
		float: left;
		border-radius: 10px;
		margin-right: 15px;
	}

	.experience-card {
		margin-bottom: 40px;
		text-align: left;
	}

	@media only screen and (max-width: 480px) {
		img {
			float: none;
			display: block;
		}
	}

</style>


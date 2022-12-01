<script>
  import Header from './lib/Header.svelte';
  import AccentSelectButton from './lib/AccentSelectButton.svelte';
  import Experience from './lib/Experience.svelte';

  const accentColors = [
    { name: "green", hex: "#5EBD3E" },
    { name: "yellow", hex: "#FFB900" },
    { name: "orange", hex: "#F78200" },
    { name: "red", hex: "#E23838" },
    { name: "purple", hex: "#973999" },
    { name: "blue", hex: "#009CDF" },
  ]

  $: selectedColor = { name: "blue", hex: "#009CDF"};
  var imageUrl = `${import.meta.env.VITE_S3_URL}/me.jpeg`;

  function toggleLonnie() {
    imageUrl = `${import.meta.env.VITE_S3_URL}/me.jpeg`;
  }
  function toggleMemoji() {
    imageUrl = `${import.meta.env.VITE_S3_URL}/memoji.png`;
  }

  function updateColors(accentColor) {
    selectedColor = accentColor;
  }

</script>

<svelte:head>
  <link rel="icon" type="image/png" href={`public/${selectedColor.name}/favicon.png`}/>
  <link rel="apple-touch-icon" type="image/png" href="/blue/favicon.png"/>
  <meta name="theme-color" content="{selectedColor.hex}" />
</svelte:head>

<main>
    <Header color={selectedColor.hex}/>

    {#each accentColors as color}
      <AccentSelectButton
        accentColor={color}
        on:click={() => updateColors(color)}
        selected={color.hex == selectedColor.hex }
        />
    {/each}

	  <!--About-->
    <h2 style="color: {selectedColor.hex};">About</h2>

    <div class="about">
      <div class="photo" on:mouseover={toggleMemoji} on:focus={toggleMemoji} on:mouseleave={toggleLonnie}>
        <img src={imageUrl} width=250 height=250 alt="A portrait of Lonnie" id="lonnie"/>
      </div>
    <p>Hi I'm Lonnie <span>👋🏻</span></p>
    <p>
      I'm an iOS developer and fourth year Computer Science Major
      at the <a href="https://rit.edu" style="text-decoration-color:#F78200;"> Rochester Institute of Technology</a>.
    </p>
    <p>
      At RIT, I'm involved with
      <a href="https://csh.rit.edu" style="text-decoration-color:#B0197E;">Computer Science House</a>
      where I help manage our public facing websites and our

      <a href="https://www.youtube.com/watch?v=g9F-1vw0m-o"> internet connected vending machines.</a>
    </p>

    <p>You can find me in the following places around the web:</p>

    <ul>
      <li>Github: <a href="https://github.com/lontronix">@Lontronix</a></li>
      <li>Twitter: <a href="https://twitter.com/lontronix">@Lontronix</a></li>
      <li>Mastodon: <a rel="me" href="https://iosdev.space/@lonnie">@lonnie@iosdev.space</a></li>
      <li>LinkedIn: <a href="https://www.linkedin.com/in/lonniegerol/">Lonnie Gerol</a></li>
      <li>Email: <a href="mailto:lonnie@lonniegerol.com">lonnie (at) lonniegerol.com</a></li>
    </ul>
    </div>

    <h2 style="color: {selectedColor.hex};" >Experience</h2>
    <p>
      If you would prefer my resume, you can find that
      <a href="gerol-resume.pdf">here</a>.
    </p>

    <!--Bryx-->
    <Experience
      experience={
        {
          company: "Bryx",
          jobTitle: "iOS Engineering Intern",
          photoSrc: `${import.meta.env.VITE_S3_URL}/companies/bryx.jpg`
        }
      }
      accentColor={selectedColor.hex}>
      <p style="display: inline;">
        At <a href="https://bryx.com">Bryx</a>
        I worked with a small team of iOS developers to improve
        <a href="https://apps.apple.com/us/app/bryx-911/id813078029">Bryx 911</a>.
        Bryx 911 is relied on by tens of thousands of first responders to do their jobs.
      </p>
    </Experience>

    <!--Apple-->
    <Experience
      experience={
        {
          company: "Apple",
          jobTitle: "Software Engineering Intern",
          photoSrc: `${import.meta.env.VITE_S3_URL}/companies/apple.jpg`
        }
      }
      accentColor={selectedColor.hex}>
      <p style="display: inline;">
        At <a href="https://apple.com">Apple</a>,
        I worked on a team that was in charge of the tvOS system shell.
        I participated in prototyping and design of a really cool new feature but
        I can't say much more <span>🤐</span>
      </p>
    </Experience>

    <!--Macro-->
    <Experience
      experience={
        {
          company: "Macro",
          jobTitle: "Software Engineering Intern",
          photoSrc: `${import.meta.env.VITE_S3_URL}/companies/macro.jpg`
        }
      }
      accentColor={selectedColor.hex}
      >
      <p style="display: inline;">
        At <a href="https://macro.io">Macro</a>
        Helped develop a Zoom client for iOS devices with a greatly improved user
        experience compared to the official client.
      </p>
    </Experience>

    <!--BBT-->
    <Experience
      experience={
        {
          company: "Bio Behavioral Therapeutics",
          jobTitle: "Freelance iOS Developer",
          photoSrc: `${import.meta.env.VITE_S3_URL}/companies/bbt.jpg`
        }
      }
      accentColor={selectedColor.hex}>
      <p style="display: inline;">
        Designed and programmed native
        <a href="https://apps.apple.com/us/app/bbt-access/id1523959641"> iOS </a>
        and
        <a href="https://play.google.com/store/apps/details?id=com.bbt.bbtaccess&hl=en_US&gl=US"> Android </a>
        apps that allows patients to to ask their practitioner questions and submit refill requests.
      </p>
    </Experience>

    <p class="copyright">
      Copyright &copy; {new Date().getFullYear()} - Lonnie Gerol All Rights Reserved.
    </p>

</main>

<style>
  @font-face {
    font-family: "JetBrains Mono";
    src: url("../JetBrainsMono/JetBrainsMono-Regular.woff2");
  }

  :global(body) {
    font-family: "JetBrains Mono";
    margin-left: 2.5em;
    margin-right: 2.5em;
    max-width: 800px;
    margin: auto;
  }

  h2 {
    text-align: left;
  }

  h2 {
    border-bottom: 3px dotted;
    padding-bottom: 5px;
  }

  p {
    text-align: left;
  }

  .copyright {
    padding-top: 20px;
    text-align: center;
  }

  .photo {
    float: right;
    width: 250px;
    height: 250px;
    padding-left: 15px;
  }

  #lonnie {
    aspect-ratio: auto 250/250;
    border-radius: 10px;
  }

  .about {
    min-height: 250px;
  }

  ul {
    text-align: left;
  }

  a {
    font-weight: bold;
  }

  a:hover {
    text-decoration: underline;
    text-decoration-thickness: 3px;
  }

  @media only screen and (max-width: 480px) {
    .photo {
      float: none;
      height: auto;
      width: 100%;
      margin: auto;
      padding: 0px;
    }

    #lonnie {
      height: auto;
      width: 100%;
    }
  }

  @media (prefers-color-scheme: light) {
    a {
      color: black;
    }
  }

  @media (prefers-color-scheme: dark) {
    a {
      color: white;
    }
  }


</style>

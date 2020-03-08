Flatiron's "Three Pillars of Web Programming"
    Recognize Events
    Manipulate the DOM
    Communicate with the Server


Example HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="./demo.css">
    <title>Simple Liker</title>
  </head>
  <body>
    <header>
      <h1>Simple Liker</h1>
    </header>
    <article class="media-post" id="201811189">
      <header>
        <h2> <span>Byron Flatiron</span> says:</h2>
      </header>
      <p>Practice your JavaScript!</p>
      <footer>
        <ul>
        <!--* This heart is what we want to recognize & manipulate  -->
          <li class="like">Like! <span class="like-glyph">♡;</span></li>
        </ul>
      </footer>
    </article>
    </body>
  <script src="demo.js" charset="utf-8"></script>
</html>

Everything Below is in our demo.js file.

1. Recognize Events
   
    let articleHearts = document.querySelectorAll('.like-glyph');

2. Manipulate the DOM (Document Object Model)
   
    <!--* We use this code, known as Objects, to control toggling like / unlike status -->
    let glyphStates = {
	'♡': '♥',
	'♥': '♡'
    };

    let colorStates = {
        red: '',
        '': 'red'
    };


    function likeCallback(e) {
	let heart = e.target;
	mimicServerCall()
		.then(function(serverMessage) {
			<!--*  STEP 2: Uncomment the next 3 lines. We'll use Pillar 1 (DOM Manipulation) to update the screen and mimic Pillar 3 (Server Communication) to only update the screen if the sending of information to the server succeeds. -->

			alert('You notified the server!');
			alert(serverMessage);
			heart.innerText = glyphStates[heart.innerText];
			heart.style.color = colorStates[heart.style.color];
		})
		.catch(function(error) {
			alert('Something went wrong!');
		});
    }

3. Communicate with the Server
    <!--* glyph is just a variable here.  -->
    for (let glyph of articleHearts) {
	glyph.addEventListener('click', likeCallback);
    }

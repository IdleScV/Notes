http://help.dottoro.com/larrqqck.php

Some Event handler examples 
- onclick
- onscroll
- keydown
- keyup
- keypres
- submit
- DOMContentLoaded


<!--!  Example of event handler in use... -->

<!-- * This sets our target which we want to have an event listener -->
    const input = document.getElementById('input');
<!-- * This applies the event listener and triggers an alert  -->
    input.addEventListener('click', function(event) {
      alert('I was clicked!');
    });



<!--! Example of event Handler moving an element with an ID of 'dodger -->



const dodger = document.getElementById('dodger');

function moveDodgerLeft() {
	let leftNumbers = dodger.style.left.replace('px', '');
	let left = parseInt(leftNumbers, 10);

	if (left > 0) {
		dodger.style.left = `${left - 1}px`;
	}
}

function moveDodgerRight() {
	let rightNumbers = dodger.style.left.replace('px', '');
	let right = parseInt(rightNumbers, 10);

	if (right > 0) {
		dodger.style.left = `${right + 1}px`;
	}
}

document.addEventListener('keydown', function(e) {
	if (e.key === 'ArrowLeft') {
		moveDodgerLeft();
	} else if (e.key === 'ArrowRight') {
		moveDodgerRight();
	}
});


<!-- ! Example of Event handler  "DOMContentLoaded" -->
 <!--* This function prints in the console & changes the inner text.  -->
const text = document.getElementById('text');

document.addEventListener('DOMContentLoaded', function() {
	console.log('I HAVE LOADED');
	text.innerText = 'This is really cool';
});



event.target VS event.currentTarget
function sleep(ms) {
	return new Promise((resolve) => setTimeout(resolve, ms));
}

function addNumToPoints(num = 1) {
	let points = document.getElementById('points');
	points.innerText = parseInt(points.innerText) + num;
}

async function hideStartButton() {
	let button = document.getElementById('start');
	let countdown = Array.from({ length: 5 }, (x, i) => i).reverse();
	for (let i = 0; i < countdown.length; i++) {
		button.innerText = countdown[i] + 1;
		await sleep(1000);
	}

	button.style.display = 'none';
	document.getElementsByClassName('game-box')[0].style.cursor = 'pointer';
	startTimer();
}

async function startTimer() {
	let countdown = document.getElementById('countdown');
	let num = parseInt(countdown.innerText);
	for (num; num > 0; num -= 1) {
		countdown.innerText = num;
		await sleep(10);
	}

	countdown.innerText = '60';
	let button = document.getElementById('start');
	button.innerText = 'Play Again?';
	button.style.display = 'block';
}

function movePlayerLeft() {
	debugger;
	let player = document.getElementById('playerBlock');
	let leftNumbers = player.style.marginLeft.replace('px', '');
	let left = parseInt(leftNumbers, 10);

	// if (left > 0) {
	player.style.marginLeft = `${left - 1}px`;
	// }
}

function movePlayerRight() {
	let player = document.getElementById('playerBlock');
	let rightNumbers = player.style.marginLeft.replace('px', '');
	let right = parseInt(rightNumbers, 10);

	// if (right > 0) {
	player.style.marginLeft = `${right + 1}px`;
	// }
}

// function allowMovement() {
document.addEventListener('keydown', function(e) {
	console.log(e);
	if (e.key === 'ArrowLeft') {
		movePlayerLeft();
	} else if (e.key === 'ArrowRight') {
		movePlayerRight();
	}
});
// }

let game_functions = [ hideStartButton ];

function game() {
	game_functions.map((fn) => fn());
}

// allowMovement();

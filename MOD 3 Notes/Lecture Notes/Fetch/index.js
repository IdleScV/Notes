document.addEventListener('DOMContentLoaded', pageSetup);

function pageSetup() {
	const animalFarmBaseURL = 'https://animal-farm-api.herokuapp.com/animals';
	let data = fetch(animalFarmBaseURL)
		.then((response) => response.json())
		.then((json) => json.forEach((animal) => renderAnimal(animal)));
}

function renderAnimal(animal) {}

function renderOnScreen(name, species) {
	let list = document.getElementsByClassName('AnimalNames')[0];
	let newItem = document.createElement('li');
	newItem.innerText = name + ' ' + species;
	list.append(newItem);
}

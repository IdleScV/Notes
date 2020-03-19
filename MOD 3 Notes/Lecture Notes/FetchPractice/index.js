document.addEventListener('DOMContentLoaded', pageSetup);

function pageSetup() {
	console.log('Connected');
	document.querySelector('.Show').addEventListener('click', getData);
}

function getUrl() {
	return 'http://pokeapi.co/api/v2/pokemon';
}

function getData() {
	fetch(getUrl())
		.then((data) => data.json())
		.then((json) => json['results'].forEach((pokemon) => processPokemon(pokemon)));
}

function processPokemon(data) {
	let PokemonName = data['name'];
	showPokemon(PokemonName);
}

function showPokemon(name) {
	let list = document.querySelector('.pokemon');
	let newList = document.createElement('li');
	newList.innerText = name;
	list.append(newList);
	document.querySelector('.Show').innerText = 'JK';
}

// debugger;

// function sayHello() {
// 	console.log('hello world');
// }

// let sayHelloExp = function() {
// 	console.log('hello world?');
// };

// function sayGoodbye() {
// 	console.log('Goodbye');
// }

// let sum = (num1, num2) => num1 + num2;

// let addOneToNumber = (num) => num + 1;

let nums = [ 1, 2, 3, 4, 5, 6 ];

let even = (num) => num % 2 === 0;
let even2 = (num) => {
	return num % 2 === 0;
};

let myFilter = (array, fn) => {
	let ans = [];
	for (let i = 0; i < array.length; i++) {
		if (fn(array[i])) {
			ans.push(array[i]);
		}
	}
	return ans;
};

console.log(myFilter(nums, even));
console.log(myFilter(nums, even2));

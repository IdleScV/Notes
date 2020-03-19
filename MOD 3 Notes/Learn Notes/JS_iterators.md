


Looping vs. iteration

Looping is the process of executing a set of statements repeatedly until a condition is met. It's great for when we want to do something a specific number of times (for loop) or unlimited times until the condition is met (while loop).

    <!-- *   For Let                -->
    let myArray = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
     
    for (let i = 0; i < myArray.length; i++) {
      console.log(myArray[i]);
    }
    <!-- *   For Of                -->
    <!-- ? Use a for...of statement anytime you want to iterate over an array. -->
    const myArray = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
     
    for (const element of myArray) {
      console.log(element);
    }
    <!-- *   For In                -->
    <!-- ? Use a for...in statement whenever you want to enumerate the properties of an object. -->
    const address = {
      street1: '11 Broadway',
      street2: '2nd Floor',
      city: 'New York',
      state: 'NY',
      zipCode: 10004
    };
     
    for (const key in address) {
        console.log(address[key]);
    }
     
    // LOG: 11 Broadway
    // LOG: 2nd Floor
    // LOG: New York
    // LOG: NY
    // LOG: 10004

Iteration is the process of executing a set of statements once for each element in a collection. Prior to ES2015, there were a few ways to do this, but none were very pretty. With a for loop:

    const array1 = [1, 4, 9, 16];

    // pass a function to map
    const map1 = array1.map(x => x * 2);

    console.log(map1);
    // expected output: Array [2, 8, 18, 32]
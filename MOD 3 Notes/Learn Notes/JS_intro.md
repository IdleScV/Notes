
<!--* Explain the JavaScript / DOM relationship -->

    JavaScript changes are made through a middle layer called the DOM, the Document Object Model. The DOM only knows how to be spoken to in JavaScript. JavaScript and the DOM have been there, together, since the beginning.

    Because they're twins, learning about the DOM will require us to write some JavaScript — which we don't know yet! And learning all the details of JavaScript language won't tell us anything about the DOM. It would just tell us how to write valid JavaScript code. It's a chicken-and-egg situation.

    To get around this problem we start by learning some basic structures of JavaScript called "sight words." We're going to learn "just enough JavaScript" so that we can start working with the DOM — the best way to understand it.

<!--* Explain "sight words" -->

    When you learned to read before you understood the process of joining letters into sounds and sounds into words, you had a limited, but powerful vocabulary. This vocabulary contained your "sight words." These are also the words you tend to memorize before you go on a trip abroad: MEN, WOMEN, WATER, FOOD, HOSPITAL.

    This lesson will provide you the "sight words" of JavaScript. Some of these lines of code you might not fully understand at first and that's OK. We'll cover them all later in more depth.

<!--* Explain "just enough JavaScript" concept -->

    We call the approach of learning JavaScript sight words "just enough JavaScript." We learn so much better by working with technology than by merely reading words.

    We take this approach because it's just more fun, as well as being much more effective. It's fun to change the text on pages or update the styling. Also, some of the JavaScript concepts tend to sneak in along the way and make learning easier.

    It's OK to come back here if you get confused or forget something. You might want to bookmark this page or keep it open in a tab as you move along. This is all OK in the "just enough" approach. In the following sections, we list several "sight words" of JavaScript. If you want to know more about a sight word, feel free to consult MDN's JavaScript Reference.

<!--* Write experimental code in Chrome DevTools -->

    Open the dev tools/console in Chrome - Ctrl+Shift+J (Windows / Linux) or Cmd+Opt+J (Mac).

    To access the Chrome dev tools settings — for example, to change the theme from light to dark — click the three vertical dots

    If at any point the console becomes cluttered with errors, warnings, or anything else, click the Clear console

<!--* Explain that JavaScript has things -->

    for example, strings and numbers 
        string = "Byron" 
        number = 2 or 3.14

<!--* Explain that JavaScript has variables -->
    
    var pi = 3.14;
        or
    let pi = 3.14;
        or
    const pi = 3.14;

    <!--* Explain that Mathematic Operations Can Be Performed on Numbers -->

    let result = 1 + 1; //=> `undefined`
    result; //=> 2

    let pi = 3.14; //=> `undefined`
    let radius = 2; //=> `undefined`

    let circumference = pi * (radius * 2); //=> `undefined`
    circumference; //=> 12.56

    10 / 4; //=> 2.5
    10 % 4; //=> 2
    13 % 5; //=> 3

    <!--* Explain How Strings Can Be Manipulated -->

    'Ya got trouble, folks, right here in ' + 'River City';
        //=> 'Ya got trouble, folks, right here in River City'

    let poolTable = 'Trouble';

    poolTable + ' with a capital T';

        //=> 'Trouble with a capital T'

    'And that rhymes with '.concat('P');
        //=> 'And that rhymes with P'
     
    let lyric = 'And that stands for ';
    let trouble = 'pool!';
    lyric.concat(trouble);
        //=> 'And that stands for pool!'

    let pool = 'trouble';
        //=> undefined
    `Ya got ${pool}, ${pool}, ${pool}, ${pool}, ${pool}...`;
        //=> 'Ya got trouble, trouble, trouble, trouble, trouble...'

    `Adding two and two equals ${2 + 2}`;
        //=> 'Adding two and two equals 4'

<!--* Explain that JavaScript can compare things -->

    1 < 3; //=> true
    3 == 3; //=> true
    3 != 4; //=> true
    5 > 2; //=> true

    3.14; //=> 3.14
    const pi = 3.14;
    pi; //=> 3.14
    pi == 3.14; //=> true

        let test = 1;
    test; //=> 1
    
    <!--* Explain that JavaScript Has Conditionals -->
    if (test < 2) {
      // test is less than 2.
      // this statement is true so the code within the brackets is executed
      test = test + 1;
    }
     
    test; //=> 2
     
    if (test < 2) {
      // test is NOT less than 2.
      // this statement is false so the code within the brackets is ignored
      test = test + 1;
    }
     
    test; //=> 2

<!--* Explain that JavaScript has collections -->

    slytherins[0]; //=> "Salazar Slytherin"
    slytherins[1]; //=> "Bellatrix Black"
    slytherins[2]; //=> "Draco Malfoy"

<!--* Explain that JavaScript is object-oriented -->

    poodle.name; 
        //=> "Byron"
    poodle.favoritePainter; 
        //=> undefined
    poodle.bark(); 
        //=> An ear-splitting bark is heard
    poodle.introduceYourselfFormally(); 
        //=> "Hello, my name is Byron the poodle"
    poodle.eat(1); 
        //=> "Byron eats 1 can of food"
    poodle.eat(2); 
        //=> "Byron eats 2 cans of food"
    poodle.eyeEnviously('Shack Burger', '$', 9.57);
        // ==> "Byron eyes your Shack Burger enviously, hoping you will drop some, not caring the least that it cost you $9.57."

<!--* Explain that JavaScript has loops -->

    for (let i = 0; i < slytherins.length; i = i + 1) {
      harry_potter.expelliarmus(slytherins[i]);
    }

<!--* Explain that JavaScript logs with console.log -->

    for (let i = 0; i < slytherins.length; i = i + 1) {
      console.log(`Harry is about to disarm ${slytherins[i]}`);
      harry_potter.expelliarmus(slytherins[i]);
      console.log(`${slytherins[i]} is defenseless!`);
    }
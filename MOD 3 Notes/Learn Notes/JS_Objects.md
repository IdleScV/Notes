Accessing Properties Dynamically

    address['zip' + 'Code'];
    // => 10004

<!-- *               -->
<!-- *Dot vs Bracket notation -->
    const meals = {
      breakfast: 'Oatmeal',
      lunch: 'Caesar salad',
      dinner: 'Chimichangas'
    };
     
    let mealName = 'lunch';
     
    meals[mealName];
    // => "Caesar salad"
 <!-- *               -->
    mealName = 'dinner';
    // => "dinner"

    meals.mealName;
    // => undefined
 <!-- *               -->
    const morningMeal = 'breakfast';
    const middayMeal = 'lunch';
    const eveningMeal = 'dinner';
     
    const meals = {
      [morningMeal]: 'French toast',
      [middayMeal]: 'Personal pizza',
      [eveningMeal]: 'Fish and chips'
    };
     
    meals;
    // => { breakfast: "French toast", lunch: "Personal pizza", dinner: "Fish and chips" }

    <!-- !VS -->
    const morningMeal = 'breakfast';
    const middayMeal = 'lunch';
    const eveningMeal = 'dinner';
     
    const meals = {
      morningMeal: 'French toast',
      middayMeal: 'Personal pizza',
      eveningMeal: 'Fish and chips'
    };
     
    meals;
    // => { morningMeal: "French toast", middayMeal: "Personal pizza", eveningMeal: "Fish and chips" }
 <!-- *               -->
 <!-- !Adding Properties -->

    const circle = {};
     
    circle.radius = 5;
     
    circle['diameter'] = 10;
     
    circle.circumference = circle.diameter * Math.PI;
    // => 31.41592653589793
     
    circle['area'] = Math.PI * circle.radius ** 2;
    // => 78.53981633974483
     
    circle;
    // => { radius: 5, diameter: 10, circumference: 31.41592653589793, area: 78.53981633974483 }

<!--* Multiple Properties can have the same value -->
    const meals = {
      breakfast: 'Avocado toast',
      lunch: 'Avocado toast',
      dinner: 'Avocado toast'
    };
     
    meals.breakfast;
    // => "Avocado toast"
     
    meals.dinner;
    // => "Avocado toast"

<!--* Keys must be unique  -->
    const meals = {
      breakfast: 'Avocado toast',
      breakfast: 'Oatmeal',
      breakfast: 'Scrambled eggs'
    };
     
    meals;
    // => { breakfast: "Scrambled eggs" }

<!-- ! Modifying Objects  -->
Ex. 
    const mondayMenu = {
      cheesePlate: {
        soft: 'Chèvre',
        semiSoft: 'Gruyère',
        hard: 'Manchego'
      },
      fries: 'Curly',
      salad: 'Cobb'
    };
     
    mondayMenu.fries = 'Sweet potato';
     
    mondayMenu;
    // => { cheesePlate: { soft: "Chèvre", semiSoft: "Gruyère", hard: "Manchego" }, fries: "Sweet potato", salad: "Cobb" }

    <!-- * in Function Form -->
    function destructivelyUpdateObject (obj, key, value) {
      obj[key] = value;
     
      return obj;
    }
    <!-- Below version doesn't modify old object -->
    function nondestructivelyUpdateObject(obj, key, value) {
      const newObj = { ...obj };
     
      // Code to return new, updated menu object
    }

<!-- ! Object.assign() -->
    Object.assign(initialObject, additionalObject, additionalObject, ...);
<!-- !Non-Destructive Object assignment Function  -->
    function createNewMenu (oldMenu, menuChanges) {
      return Object.assign({}, oldMenu, menuChanges);
    }
     
    const tuesdayMenu = {
      cheesePlate: {
        soft: 'Chèvre',
        semiSoft: 'Gruyère',
        hard: 'Manchego'
      },
      fries: 'Sweet potato',
      salad: 'Caesar'
    };
     
    const newOfferings = {
      cheesePlate: {
        soft: 'Brie',
        semiSoft: 'Fontina',
        hard: 'Provolone'
      },
      salad: 'Southwestern'
    };
     
    const wednesdayMenu = createNewMenu(tuesdayMenu, newOfferings);
     
    wednesdayMenu;
    // => { cheesePlate: { soft: "Brie", semiSoft: "Fontina", hard: "Provolone" }, fries: "Sweet potato", salad: "Southwestern" }
     
    tuesdayMenu;
    // => { cheesePlate: { soft: "Chèvre", semiSoft: "Gruyère", hard: "Manchego" }, fries: "Sweet potato", salad: "Caesar" }

Note: For deep cloning, we need to use other alternatives because Object.assign() copies property values.

For example, if newOfferings did not have an updated value for hard, the hard key & value pair would not appear no the wendesdayMenu

<!-- ! Object.keys() -->
    const wednesdayMenu = {
      cheesePlate: {
        soft: 'Brie',
        semiSoft: 'Fontina',
        hard: 'Provolone'
      },
      fries: 'Sweet potato',
      salad: 'Southwestern'
    };
     
    Object.keys(wednesdayMenu);
    // => ["cheesePlate", "fries", "salad"]

<!-- ! Delete -->
    const wednesdayMenu = {
      cheesePlate: {
        soft: 'Brie',
        semiSoft: 'Fontina',
        hard: 'Provolone'
      },
      fries: 'Sweet potato',
      salad: 'Southwestern'
    };
     
    delete wednesdayMenu.salad;
    // => true
     
    wednesdayMenu;
    // => { cheesePlate: { soft: "Brie", semiSoft: "Fontina", hard: "Provolone" }, fries: "Sweet potato" }

<!-- !Arrays are Object -->
    typeof [];
    // => "object"

    const myArray = [];
     
    myArray.summary = 'Empty array!';
     
    myArray;
    // => [summary: "Empty array!"]

    myArray['summary'] = 'This array is totally empty.';
     
    myArray;
    // => [summary: "This array is totally empty."]
     
    myArray.summary;
    // => "This array is totally empty."

    myArray.push(2, 3, 5, 7);
    // => 4
     
    myArray;
    // => [2, 3, 5, 7, summary: "This array is totally empty."]

    myArray.length
    // => 4
    
    (one of the 'special' features of an Array is that its Array-style 
    elements are stored separately from its Object-style properties. 
    The .length property of an Array describes how many items exist 
    in its special list of elements. 
    Its Object-style properties are not included in that calculation.)

    myArray[myArray.length - 1];
    // => 7
    <!-- * all keys in Objects and all indexes in Arrays are actually strings.  -->

    const myArray = [2, 3, 5, 7];
     
    myArray['1'] = 'Hi';
    // => "Hi"
     
    myArray;
    // => [2, "Hi", 5, 7]
     
    myArray['01'] = 'Ho';
    // => "Ho"
     
    myArray;
    // => [2, "Hi", 5, 7, 01: "Ho"]
     
    myArray[01];
    // => "Hi"
     
    myArray['01'];
    // => "Ho"

        After adding our weird '01' property, the .length property still returns 4:

    myArray.length;
    // => 4

        So it would stand to reason that Object.keys() would only return '01', right?

    Object.keys(myArray);
    // => ["0", "1", "2", "3", "01"]

        Unfortunately not. The reason why Arrays have this behavior would take us deep inside the JavaScript source code, and it's frankly not that important. Just remember these simple guidelines, and you'll be just fine:

NOTES: 

    For accessing elements in an Array, always use integers.
    Be wary of setting Object-style properties on an Array. There's rarely any reason to, and it's usually more trouble than it's worth.
    Remember that all Object keys, including Array indexes, are strings. This will really come into play when we learn how to iterate over Objects, so keep it in the back of your mind.

<!--* Methods . . .  -->
.push() => Adds to end of array
.unshift() => Adds to beginning of array


<!--* Spread Operators . . .  -->
const coolCities = ['New York', 'San Francisco'];
 
const allCities = ['Los Angeles', ...coolCities];
 
allCities;
// => ["Los Angeles", "New York", "San Francisco"]


const coolCats = ['Hobbes', 'Felix', 'Tom'];
 
const allCats = [...coolCats, 'Garfield'];
 
allCats;
// => ["Hobbes", "Felix", "Tom", "Garfield"]

<!--* Slice... -->
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
     
    days.slice(2, 5);
    // => ["Wed", "Thu", "Fri"]
     
    days.slice(5);
    // => ["Sat", "Sun"]

    days.slice(1);
    // => ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    days.slice(0, days.length - 1);
    // => ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    days.slice(-1);
    // => ["Sun"]
    
    days.slice(-3);
    // => ["Fri", "Sat", "Sun"]

    While .slice() allows us to return a piece of an Array without mutating the original (nondestructive), .splice() performs destructive actions

<!--* Splice -->
    array.splice(start)
    array.splice(start, deleteCount)
    array.splice(start, deleteCount, item1, item2, ...)

    <!--* With a Single Argument -->
        - destructively remove a chunk of the original Array beginning at the provided index and continuing to the end of the Array

        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        
        days.splice(2);
        // => ["Wed", "Thu", "Fri", "Sat", "Sun"]
        
        days;
        // => ["Mon", "Tue"]

        <!--* Negative index -->
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        
        days.splice(-2);
        // => ["Sat", "Sun"]
        
        days;
        // => ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    <!--* With Two Arguments -->
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        
        days.splice(2, 3);
        // => ["Wed", "Thu", "Fri"]
        
        days;
        // => ["Mon", "Tue", "Sat", "Sun"]

    <!--* .splice() with 3+ arguments -->
        - After the first two, every additional argument passed to .splice() will be inserted into the Array at the position indicated by the first argument. We can replace a single element in an Array as follows, discarding a card and drawing a new one:

        const cards = ['Ace of Spades', 'Jack of Clubs', 'Nine of Clubs', 'Nine of Diamonds', 'Three of Hearts'];
     
        cards.splice(2, 1, 'Ace of Clubs');
        // => ["Nine of Clubs"]

        <!--* Or we can remove two elements and insert three new ones -->
        cards;
        // => ["Ace of Spades", "Jack of Clubs", "Ace of Clubs", "Nine of Diamonds", "Three of Hearts"]

        const menu = ['Jalapeno Poppers', 'Cheeseburger', 'Fish and Chips', 'French Fries', 'Onion Rings'];
     
        menu.splice(1, 2, 'Veggie Burger', 'House Salad', 'Teriyaki Tofu');
        // => ["Cheeseburger", "Fish and Chips"]
        
        menu;
        // => ["Jalapeno Poppers", "Veggie Burger", "House Salad", "Teriyaki Tofu", "French Fries", "Onion Rings"]

        <!--* We aren't required to remove anything with .splice() — we can use it to insert elements anywhere within an Array. -->
        const books = ['Bleak House', 'David Copperfield', 'Our Mutual Friend'];
     
        books.splice(2, 0, 'Great Expectations', 'Oliver Twist');
        // => []
        
        books;
        // => ["Bleak House", "David Copperfield", "Great Expectations", "Oliver Twist", "Our Mutual Friend"]

<!--* Slicing and Spreading -->
    const menu = ['Jalapeno Poppers', 'Cheeseburger', 'Fish and Chips', 'French Fries', 'Onion Rings'];
     
    const newMenu = [...menu.slice(0, 1), 'Veggie Burger', 'House Salad', 'Teriyaki Tofu', ...menu.slice(3)];
     
    menu;
    // => ["Jalapeno Poppers", "Cheeseburger", "Fish and Chips", "French Fries", "Onion Rings"]
     
    newMenu;
    // => ["Jalapeno Poppers", "Veggie Burger", "House Salad", "Teriyaki Tofu", "French Fries", "Onion Rings"]
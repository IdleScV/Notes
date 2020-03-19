<!--! Functions Declaration -->
<!-- * Hosting moves all funcion declarations to the top -->

    function sayHello(){
        console.log("Hello World")
    }

<!--! Function Expression -->
    
    let sayHello = function(){
        console.log("Hello World)
    }


<!--! Arrow Function -->
Example . . .

    let addOneToNumber = function(num){
        return num+1
    }

    <!-- * Change to arrow function  -->

    let addOneToNumber = num =>  num + 1

Example . . .
    
    let sum = function(num1, num2){
        return num1 + num2
    }

    <!-- * Change to arrow function  -->

    let sum = (num1, num2) => num1 + num2

<!-- ! Variable Declarations -->

    let teacher = "Dumbledore"
    let teacher = "Snape"

    console.log(teacher)
    => Error
<!-- * -->
    let teacher = "Dumbledore"
    teacher = "Snape"

    console.log(teacher)
    => Snape
<!-- * -->
    var teacher = "Dumbledore"
    var teacher = "Snape"

    console.log(teacher)
    => Snape
 <!-- * -->
    const teacher = "Dumbledore"
    teacher = "Snape"

    console.log(teacher)
    => Error
 <!-- * -->
    const teacher = {name: "Dumbledore"}
    teacher.name = "Snape"

    console.log(teacher)
    => {name: "Snape"}

    teacher.location = "somewhere"

    teacher
    => Object { name: "Snape", location: "somewhere" }

 <!-- ! Block Scoping -->
    let teacher = "Flitwick"
    function favoriteTeacher(){
        let teacher = "Dumbledore"
        console.log(teacher)
    }

    favoriteTeacher()
    console.log(teacher)
    => DumbleDore
    => Flitwick

<!-- !Callbacks and Iterators -->
    function sayHey(){
        console.log("Hey)
    }

    function executeThis(fn){
        <!-- *This is a call back function -->
        fn()
    }

    => executeThis(sayHey)
        => "Hey"
        => undefined
 <!-- * -->
    function timesTwo(num){
        return num*2
    }

    let numbers = [1, 2, 3]
    let doubled = numbers.map(timesTwo)

    => doubled
        =>[2, 4, 6]
 <!-- * SAMETHING BUT MORE WORDS -->
    let numbers = [1, 2, 3]

    function timesTwo(num){
        return num*2
    }

    let myMap = function(arr, func){
        let results = [];
        for (let i=0; i<arr.length; i++){
            let newValue = myFunc(arr[i])
            results.push(newValue)
        }
        return results
    }

    => myMap(numbers, timesTwo)
        => [2, 4, 6]
GLOBAL SCOPE

    // 'myFunc' is declared in the global scope and available everywhere in your code:
    function myFunc () {
      return 42;
    }
    // => undefined
     
    // 'myVar' is able to reference and invoke 'myFunc' because both are declared in the same scope (the global execution context):
    const myVar = myFunc() * 2;
    // => undefined
     
    myVar;
    // => 84

    <!--//                                          -->
FUNCTION SCOPE

    function myFunc () {
      const myVar = 42;
     
      return myVar * 2;
    }
    // => undefined
     
    myFunc();
    // => 84

    <!--//  -->

    function myFunc () {
      const myVar = 42;
    }
    // => undefined
     
    myVar * 2;
    // Uncaught ReferenceError: myVar is not defined

    <!--//                                          -->
BLOCK SCOPE

    if (true) {
      var myVar = 42;
    }
     
    myVar;
    // => 42

    <!--//  -->

    if (true) {
      const myVar = 42;
     
      let myOtherVar = 9001;
    }
     
    myVar;
    // Uncaught ReferenceError: myVar is not defined
     
    myOtherVar;
    // Uncaught ReferenceError: myOtherVar is not defined

<!-- ! -->
    Variables created without a const, let, or var keyword are always globally-scoped, 
    regardless of where they sit in your code. 
    If you create one inside of a block, it's still available globally:

        if (true) {
        lastName = 'Lovelace';
        }
        
        lastName;
        // => "Lovelace"

    Or in a function:

        function bankAccount () {
        secretPassword = 'il0v3pupp135';
        
        return 'bankAccount() function invoked!';
        }
        
        bankAccount();
        // => "bankAccount() function invoked!"
        
        secretPassword;
        // => "il0v3pupp135"
<!-- !                                                                                  -->


    Declare all of your functions at the top of their scope. If the functions are declared in the global scope, simply put them at the top of the JavaScript file. If they're declared inside another function, put the declaration at the top of the function body.

    Make your default variable declaration keywords const and let. You might occasionally find old code or see code samples that has var. Don't panic! Be aware that var-declared variables are not scoped like let and might require a bit of careful inspection if you're debugging some code with them.

Floats

typeof(NaN) => "number"

.2+.2 = .4
.2+.1 = .3000...004

1 + "1" => "11"


<!--* default use triple equal sign, use double equal sign with intent  -->
0 == "0" => true

0 === "0" => false

0 == [] => true

"0" == [] => false



Objects . . .

let flatiron = {
	name: 'Flat Iron School',
	location: 'Washington DC'
};

// flatiron["name"]
// "Flat Iron School"
// flatiron.name
// "Flat Iron School"



Invoking Functions
call with ()


Passing by value vs Passing by reference

    function addTwo(y) {
        let z = y
        z.num = z.num + 2
        return z
    }
    debugger
    let a = {num:4} 
    let b = addTwo(a)

    <!--! in console...  -->

    a... returns {num: 6}
    b... returns {num: 6}


HOWEVER 

    function addTwo(y) {
        let z = {...y}
        z.num = z.num + 2
        return z
    }
    debugger
    let a = {num:4} 
    let b = addTwo(a)

    <!--! in console...  -->

    a... returns {num: 4}
    b... returns {num: 6}
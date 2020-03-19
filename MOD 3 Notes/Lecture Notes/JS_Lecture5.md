Single Page Application

Maipulating the Front End
When <some event A> happens, I want to make a <what kind of B> fetch call, and manipulate the DOM <how C>?

Example deliverables . . .

    - As a User, I can see a list of all Pokemon
      - PAGE LOAD, 
      - GET fetch to "/pokemon", 
      - Rendering all the pokemon

    - As a User, I can add a pokemon by submitting a form
      - form is submitted, 
      - Post fetch to "/pokemon", 
      - Adding a new pokemon



Processing form information, fetch POST

function processCreateForm(event){
    event.preventDefault()
    let value = event.target.value
    let payload = { key: value, key: value}

    fetch(url, {
        method: "POST",
        headers: {
            <!--* Our Content Type *-->
            "Content-Type": "application.json"
        },
        body: JSON.stringify(payload)
    }).then( res => res.json() )
    .then( elemenet => renderElement(element))

}
EventData = {
    user: user instance
    object: {type: "", id: int},
    snippet: "",
    details:  "",
    date: "",
    location: location instance,
    category: {
        type: ["", ""]
    },
    link:{
        url: ""
    },
    image: {
        url: ""
        text: ""
    }
    
}


        object_id = {type= Person, World, Country, City}
        snippet = summary of the event with a char limit
        details =  detailed description of the event
        date = date
        location = location_id 
        category = type of event. for ex. Major Personal, Minor Personal, World,  Country, City
        link = { url = url , text = text to be hyperlinked}
        image = { url = url, text = subtext} 


Person = {
    name: "",
    birthday: "",
    deathday: "",
    initial_state: {location: birth_location, age: 0}
    parents: ["", ""],
    partner: ""
}

        name = name
        birthday = day/month/year
        deathday = null or day/month/year 
        initial_state = used to track age
        parents = if data null, don't display

Timeline = {
    user: user instance,
    Person: person instace,
    events: [event_instances],
    created: "",
    updated: ""
}


Country = {
    name: ""
}

City = {
    country: country instance,
    name: ""
}



User = {
    username: " "
}




Form Example...
 
    class Form extends React.Component {
    state = {
        firstName: "John",
        lastName: "Henry",
        submittedData: []
    }
    
    handleFirstNameChange = event => {
        this.setState({
        firstName: event.target.value
        })
    }
    
    handleLastNameChange = event => {
        this.setState({
        lastName: event.target.value
        })
    }
    
    handleSubmit = event => {
        event.preventDefault()
        let formData = { firstName: this.state.firstName, lastName: this.state.lastName }
        let dataArray = this.state.submittedData.concat(formData)
        this.setState({submittedData: dataArray})
    }
    
    listOfSubmissions = () => {
        return this.state.submittedData.map(data => {
        return <div><span>{data.firstName}</span> <span>{data.lastName}</span></div>
        })
    }
    
    render() {
        return (
        <div>
            <form onSubmit={event => this.handleSubmit(event)}>
            <input
                type="text"
                onChange={event => this.handleFirstNameChange(event)}
                value={this.state.firstName}
            />
            <input
                type="text"
                onChange={event => this.handleLastNameChange(event)}
                value={this.state.lastName}
            />
            <input type="submit"/>
            </form>
            {this.listOfSubmissions()}
        </div>
        )
    }
    }


    
Form elements include <input>, <textarea>, <select>, and <form> itself. When we talk about inputs in this lesson, we broadly mean the form elements (<input>, <textarea>, <select>) and not always specifically just <input>.

To control the value of these inputs, we use a prop specific to that type of input:

For <input>, <textarea>, and <option>, we use value, as we have seen.

For <input type="checkbox"> and <input type="radio">, we use checked

Each of these attributes can be set based on a state value. Each also has an onChange event listener, allowing us to update state when a user interacts with a form

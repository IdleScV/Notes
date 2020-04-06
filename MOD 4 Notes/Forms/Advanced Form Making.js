// !Bottom of 
//! https://learn.co/tracks/module-4-web-development-immersive-2-1/v2-components/forms/forms

    
    //* src/components/ParentComponent
    import React from 'react';
    import Form from './Form'
    import DisplayData from './DisplayData'
     
    class ParentComponent extends React.Component {
      state = {
        firstName: "",
        lastName: "",
      }
     
      handleChange = event => {
        this.setState({
          [event.target.name]: event.target.value
        })
      }
     
      render() {
        return (
          <div>
            <Form
              formData={this.state}
              handleChange={this.handleChange}
            />
            <DisplayData formData={this.state} />
          </div>
        )
      }
    }
     
    export default ParentComponent;

    //* src/components/Form
    import React from 'react';
     
    class Form extends React.Component {
      render() {
        return (
          <div>
            <form>
              <input
                type="text"
                name="firstName"
                onChange={event => this.props.handleChange(event)}
                value={this.props.formData.firstName}
              />
              <input
                type="text"
                name="lastName"
                onChange={event => this.props.handleChange(event)}
                value={this.props.formData.lastName} />
            </form>
          </div>
        )
      }
    }
     
    export default Form;

    //* src/components/DisplayData.js
    import React from 'react';
     
    class DisplayData extends React.Component {
      render() {
        return (
          <div>
            <h1>{this.props.formData.firstName}</h1>
            <h1>{this.props.formData.lastName}</h1>
          </div>
        )
      }
    }
     
    export default DisplayData

    //* src/index.js
    import React from 'react';
    import ReactDOM from 'react-dom';
    import ParentComponent from './components/ParentComponent';
     
    ReactDOM.render(
      <div>
        <ParentComponent/>
      </div>,
      document.getElementById('root')
    );
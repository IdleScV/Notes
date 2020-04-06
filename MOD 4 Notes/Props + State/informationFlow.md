Passing functions back and forth.
https://learn.co/tracks/module-4-web-development-immersive-2-1/v2-components/information-flow/react-information-flow-code-along

Example
<!--? Parent.component.jsx  -->
class Parent extends Component {
    constructor() {
        super()
        this.state = {
        color: getRandomColor()
        }
    }
    
    changeColor = () => {
        this.setState({
        color: getRandomColor()
        })
    }
    
    render() {
        return (
            <div className="parent" style={{backgroundColor: this.state.color}}>
            <!--! We pass through the function here -->
            <Child handleColorChange={this.changeColor}/>
            <Child handleColorChange={this.changeColor}/>
            </div>
        )
    }
}

<!-- ? Child.component.jsx -->
1. take a look at the child
    class Child extends Component {
        render() {
            console.log(this.props)
            <!--! This console.logs...{handleColorChange: ƒ} -->
            return (
            <div
                className="child"
                style={{ backgroundColor: "#FFF" }}
            ></div>
            )
        }
    }


2. we can use the method like so in Child component
    render() {
        return (
            <div onClick={this.props.handleColorChange}
            className="child"
            style={{backgroundColor: "#FFF"}}
            ></div>
        )
    }
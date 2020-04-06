Unlike Props, state can change during the component's life

setting up states...
    example:
        class MyComp extends React.Component {
        
        <!--! we use the constructor to set the INITIAL STATE -->
        constructor() {
            super()
            this.state = {
                count: 0
            }
        }
        
        <!--! our increment method makes use of the 'setState' method, which is what we use to alter state -->
        increment = () => {
            console.log(`before setState: ${this.state.count}`)
        
            this.setState({
            count: this.state.count + 1
            })
        
            console.log(`after setState: ${this.state.count}`)
        }
                
        render() {
            return (
            <!--! Event listener 'click'  -->
            <div onClick={this.increment}>
                {this.state.count}
            </div>
            )
        }
        }
            

setState() => sets/updates state
- this is an asynchronous function
  - when above div is clicked twice, it would console.log
    - before setState: 0
    - after setState: 0
    - before setState: 1
    - after setState: 1


React passes a component's props as an argument into the constructor (i.e., constructor(props)). 
- this is neccessary if we want to use the props as a state.
- However, we can call this.props.[propName] mostly anywhere else
    example...

class Bomb extends Component {
    
    constructor(props) {
        <!--! This wouldn't work if constructor was written without an arguement -->
        super()
        this.state = {
            secondsLeft: props.initialCount
        }
    }
    render() {
        return (
            <div>This is the Bomb Component</div>
        )


    }
}



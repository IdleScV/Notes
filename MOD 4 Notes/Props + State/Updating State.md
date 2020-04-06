<!--! Use this.setState() to update the state. -->

Example...
    1. our state
    
        this.state = {
        hasBeenClicked: false,
        noTouch: 3
        };

    2. update state
    
        this.setState({
            hasBeenClicked: true
        })

    3. our state now.
    
        this.state = {
        hasBeenClicked: false,
        noTouch: 3
        };

<!--! However, this can't update states that are objects. -->

Example...
    1. our state
   
        this.state = {
            theme: 'blue',
            addressInfo: {
                street: null,
                number: null,
                city: null,
                country: null
            },
        }

    2. update state
   
        this.setState({
            addressInfo: {
                city: 'New York City'
            }
        });
    
    3. our state now.

        this.state = {
            theme: 'blue',
            addressInfo: {
                city: 'New York City',
            },
        }

<!--! We can navigate this problem with Object.assign -->

Example...
    1. our state
   
        this.state = {
            theme: 'blue',
            addressInfo: {
                street: null,
                number: null,
                city: null,
                country: null
            },
        }

    2. update state (with Object.assign)

        this.setState({
            addressInfo: Object.assign({}, this.state.addressInfo, {
                city: 'New York City'
            })
        });

    <!-- OR -->

    2. update state (with the spread operator)

        this.setState({
            addressInfo: {
                ...this.state.addressInfo,
                city: 'New York City'
            }
        });

    3. our new state
   
        {
            theme: 'blue',
            addressInfo: {
                street: null,
                number: null,
                city: 'New York City',
                country: null
            },
        }

<!--! Updating State Based on the Previous State  -->

    handleClick = () => {
        this.setState(previousState => {
            return {
                count: previousState.count + 1
            }
        })
    }

Example Lightswitch Component...

    class LightSwitch extends React.Component {
    constructor() {
        super();
    
        // Initial state is defined
        this.state = {
        toggled: false
        };
    }
    
    // when handleClick is called, setState will update the state so that toggle is reversed
    handleClick = () => {
        this.setState(previousState => {
        return {
            toggled: !previousState.toggled
        }
        })
    }
    
    render() {
        return (
        <div>
            <button onClick={this.handleClick}>{this.state.toggled ? "ON" : "OFF"}</button>
        </div>
        );
    }
    }

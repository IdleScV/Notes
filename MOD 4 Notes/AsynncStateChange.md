    handleClick = () => {
        this.setState({
            hasBeenClicked: true
        }, () => console.log(this.state.hasBeenClicked)) // prints true
        console.log(this.state.hasBeenClicked); // prints false
    }



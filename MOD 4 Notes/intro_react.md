React is built off of NPM (Node package manager)
Node is javascript that lives off the browser

1. Creating React application
    in console...
      npx create-react-app [app name]
    
    then to download additional dependencies...
      npm install

    to host it on a server...
      cd into director then... 
      npm start
<!-- ! Or use (npm install && npm start) -->

side note:
- index.js is not referneced in the browser html because react creates a bundle.js file that is the rendering of all of our code




<!--! Class components vs Function components -->
- react needs to be imported for both types 


<!--? Class Component -->
- class components need to inherit from Component class
- class components need to have a render instance
- 'console.log(this)' before 'return ()' to show what each component has 
- allows state and lifecycle use
  
  example ...

    class Comment extends React.Component {
      render(){
        return(

        )
      }
    }

<!--? Functional Component -->
- simple component that returns jsx directly 
- much more succinct 
  example...

    const [Component Name] = (props) => {
      console.log(props)
      return (


      )
    }


passing props through components . . . 
<Component [propName]={propItem} key={propId} />
1. Naming Convention
   - PascalCase for component file name and folder name- Generally I want to indicate if my components are container or component. Containers will usually be class components (hooks might change that for me) that contain state and logic, whereas components
will house the actual content, styling and receive props from container. Example:
  - `MyComponent.container.js`
  - `MyComponent.component.js`
  - `MyComponent.styles.js`- lowerCamelCase for Higher Order Component file and folder name- lowercase for all other root directory folders. For example: `src`, `components`, `assets`

2. Destrucutre all Objects
<label>{ this.props.foo }</label> // wrong

const { foo } = this.props;
<label>{ foo }</label>            // right

const someFunction = (arguments) => 
  this.setState({ 
   foo: arguments.bar
}); 	                         // wrong

const someFunction = ({ baz }) =>
  this.setState({ 
    foo: baz 
});         	                // right

3. Use function expressions (and fat arrow) over function declarations
   
Function declaration:     // wrong
  function(argument) {
    // some action
  };

Function expression:   // right
  const someFunction = function (arguments){ 
    // some action
  }

Fat arrow:             //right
  someFunction = argument => // some action

4. Folder Structure
   - public
   - build
   - node_modules
   - src
       |_ components
           |_ MyComponentFolder
               |_ MyComponent.container.js
               |_ MyComponent.component.js // can be .jsx or .tsx
               |_ MyComponent.styles.js
               |_ MyComponent.test.js // like to bundle components
           |_ index.js // export all components from one single source.
       |_ actions
            |_ Actions.js // houses and exports actions and their logic
            |_ ActionTypes.js // houses and exports action type
        |_ reducers
                |_ index.js
                |_ MyReducer.reducer.js
       |_ assets
           |_ images // folder
           |_ fonts // folder  
       |_ context
          |_ Mycontext.js  // updated 10/22/19 with or without redux
       |_ services
       |_ utils
           |_ styles
              |_ global.js //I store all my global styles
              |_ helpers.js
           |_ tests
              |_ helpers.js // I store handy functions here
       |_ App.js
       |_ index.js
       |_ store.js // initialize and setup store
   - .eslintrc
   - .eslintignore
   - .prettierrc

5. App.js 
    import React, { Fragment } from 'react'
    import { SomeComponent, OtherComponent } from '../../components/index.js' // more about this later..
    import { Provider } from 'react-redux';
    import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
    import { GlobalStyle } from './utils/styles/global';const App = () => (
    <Provider store={store}> 
        <Fragment>
            <GlobalStyle />
            <Router>
                <Switch> // Will allow us to access nested routes.
                        // NOTE: if you add exact without <switch>,
                        // you wont be able to access those routes
                    <Route path="/" component={SomeComponent}>
                    <Route exact path="/" component={OtherComponent}>
                </Switch>
            </Router>
        </Fragment>
    </Provider>
    );

6.
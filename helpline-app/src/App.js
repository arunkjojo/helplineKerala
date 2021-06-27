import React from 'react';
import { BrowserRouter, Switch, Route, Redirect } from 'react-router-dom';
import Public from './pages/public/Public';
import Private from './pages/private/Private';
import Auth from './helper/Auth';
import ProtectedRoute from './pages/private/ProtectedRoute';
class App extends React.Component{
  render(){
    return(
      <BrowserRouter>
        <Switch>
          <Route path="/public"> 
            {!Auth.isAuth() && <Public/>}
          </Route>
          <ProtectedRoute path="/app"> 
            <Private/>
          </ProtectedRoute>
          <Route exact path="/">
          {Auth.isAuth() ? <Redirect to="/app" /> : <Redirect to="/public" />}
        </Route>
        </Switch>
      </BrowserRouter>
    );
  }
}
export default App;
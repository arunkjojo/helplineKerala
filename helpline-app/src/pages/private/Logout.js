import {Component} from 'react';
import Auth from '../../helper/Auth';
class Logout extends Component{
  constructor(props){
    super(props);
    Auth.logout();
    window.location.replace('../public');
  }
  render() {
    return null;
  }
}
export default Logout;
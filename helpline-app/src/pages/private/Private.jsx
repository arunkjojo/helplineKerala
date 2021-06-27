import React from 'react';
import Posts from './Posts';
import Addpost from './Addpost';
import Logout from './Logout';
import VerifyPost from './VerifyPost';
import RejectedPost from './RejectedPost';
import AcceptedPost from './AcceptedPost';
import ProtectedRoute from './ProtectedRoute';
import {
  Switch,
  Link
} from 'react-router-dom';
import Cookies from 'js-cookie';
class Private extends React.Component{
  
  constructor(props){
    super(props);
    this.state={
      privilage:'',
      mode:'online'
    }    
  }
  

  componentDidMount() {
    if (!navigator.onLine) {
      this.setState({
        mode:'offline'
      });
    }
    document.getElementById('body').className='private';
    let user=JSON.parse(Cookies.get('user'));
    switch (user.type) {
      case 'Police':
        this.setState({privilage:'true'});
      break;
      case 'Fire Force':
        this.setState({privilage:'true'});
      break;
      case 'Government Authority':
        this.setState({privilage:'true'});
      break;
      default:
        this.setState({privilage:'false'});
      break;
    }
  }

  componentWillUnmount() {
    document.getElementById('body').className='';
  }

  render(){
    return(
      <div>
        <header>
          <nav className="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div className="container-fluid">
              <h6 style={{color: "white"}} className="nav-link active">Helpline Kerala</h6>
              <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
              </button>
              <div className="collapse navbar-collapse" id="navbarCollapse">
                <ul className="navbar-nav me-auto mb-2 mb-md-0">
                  <li className="nav-item">
                    <Link className="nav-link active"  to="/app">Home</Link>
                  </li>
                  <li className="nav-item">
                    <Link className="nav-link"  to="/app/create">Add New Request</Link>
                  </li>
                  {this.state.privilage === 'true'?(
                    <li className="nav-item">
                      <Link className="nav-link" to="/app/verify">Pending Verify</Link>
                    </li>
                  ):''}
                  {this.state.privilage === 'true'?(
                    <li className="nav-item">
                      <Link className="nav-link" to="/app/accepted">Verified Post</Link>
                    </li>
                  ):''}
                  {this.state.privilage === 'true'?(
                    <li className="nav-item">
                      <Link className="nav-link" to="/app/rejected">Rejected Post</Link>
                    </li>
                  ):''}
                  <li className="nav-item">
                    <Link className="nav-link"  to="/app/logout">Logout</Link>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </header>

        <main className="px-3 mt-menu">
          <Switch>
            <ProtectedRoute path="/app" exact component={Posts}/>  
            {/* <ProtectedRoute path="/app/profile" component={Profile}/> */}
            {this.state.privilage==='true'?(
              <ProtectedRoute path="/app/verify" component={VerifyPost}/>
            ):''}
            {this.state.privilage==='true'?(
              <ProtectedRoute path="/app/accepted" component={AcceptedPost}/>
            ):''}
            {this.state.privilage==='true'?(
              <ProtectedRoute path="/app/rejected" component={RejectedPost}/>
            ):''}
            <ProtectedRoute path="/app/create" component={Addpost}/>
            <ProtectedRoute path="/app/logout" component={Logout}/>
          </Switch>
        </main>
        {this.state.mode === 'offline'?(<div>Application is Offline Mode</div>):null}
      </div>  
    );
  }
  
}
export default Private;
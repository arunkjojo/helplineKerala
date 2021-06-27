import React from 'react';
import moment from 'moment';
import axios from 'axios';
import Cookies from 'js-cookie';
import { Image } from "react-bootstrap";
import { Button, Checkbox} from '@material-ui/core';

class VerifyPost extends React.Component{
    
    constructor()
    {
        super()
        this.state={
            posts:[],
            verify:0,
            actions : 'verify',
            post_id:''
        }
    }
    

        

    inputSet = (e)=>{

        this.setState({ [e.target.name] : (e.target.value)});

    }
    approveForm = (e)=>{
        const usr=Cookies.getJSON("user");
        var data={
            user_id : usr.id,
            verify : this.state.verify,
            id: this.state.post_id,
            actions : this.state.actions,
        }
        e.preventDefault();
        return axios.post('//api.helplinekerala.com/verify_post.php',data)
        .then( response =>{
            // handle success
            if(response.data.status){
                window.location.replace("../app");
            }
        })
        .catch(function (error) {
            // handle error
            console.log(error);
        });
    }
    componentDidMount() {
        const user = Cookies.getJSON("user");

        return axios.get('//api.helplinekerala.com/pending_post.php',{
            params: {
                user_id:user.id
            }
        })
        .then( response =>{
            // handle success
            // console.log(response.data);
            this.setState({posts:response.data});
            
        })
        .catch(function (error) {
            // handle error
            console.log(error);
        });
        
    }
    
    render(){
        
        var postItems = this.state.posts.map((post, i) =>
            <div className="col-sm-6 col-lg-4 mb-4" key={i}>
                <div className="card">
                    {(post.image_video)? 
                    // <svg className="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="https:://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">{post.image_video}</text></svg>
                    <Image className="img-fluid" src={post.path}/>: ""}

                    <div className="card-body">
                        <span style={{float: "left"}}>
                            <p className="card-text">{post.message}</p>
                            <p className="card-text"><small className="text-muted">Created At {moment(post.post_date+' '+post.post_time, "DD-MM-YYYY hh:mm:ss a").fromNow()}</small></p>
                            {/* <p className="card-text"><small className="text-muted">latitude:{post.latitude} longitude:{post.longitude}</small></p> */}
                            <p className="card-text"><small className="text-muted">Views:{post.view_list}</small></p>
                        </span>
                        <span>
                            <form className="form-group" noValidate>
                                <select placeholder="Select Status" onChange={this.inputSet} className="form-control" id="verify" name="verify" required noValidate>
                                    <option selected disabled>Select Status</option>
                                    <option value="0">Pending</option>
                                    <option value="1">Verified</option>
                                    <option value="2">Rejected</option>
                                </select>
                                <Checkbox type="checkbox" onClick={this.inputSet} id="post_id" value={post.id} name="post_id" required/>Confirm
                                <Button className="form-control" variant="contained" color="primary" onClick={this.approveForm}>Verify</Button>
                            </form>
                        </span>
                    </div>
                    <div className="border-top d-flex card-footer">
                        <div className="card-post__author d-flex">
                            {/* <p> <Image className="card-post__author-avatar card-post__author-avatar--small" scr="//api.helplinekerala.com/profile/post-icon.png" /></p> */}
                            {/* <Image className="card-post__author-avatar" scr="//api.helplinekerala.com/profile/post-icon.png" roundedCircle/> */}
                            <div className="d-flex flex-column justify-content-center ml-3"> 
                                <span className="card-post__author-name">{post.user_name}</span>
                                <small className="text-muted">{post.post_date}</small>
                            </div>
                        </div>
                        <div className="my-auto ml-auto">
                            <button className="btn btn-white btn-sm">
                                <i className="far fa-bookmark mr-1"></i> {post.latitude} {post.longitude}
                            </button>
                        </div>
                        
                    </div>
                </div>
            </div>
        );
        // console.log(postItems);
        return(
            <div className="container">
                <div className="row" data-masonry='{"percentPosition": true }'>
                    {postItems}
                </div>
            </div>
        )
    }
}
export default VerifyPost
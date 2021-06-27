import React from 'react';
import moment from 'moment';
import axios from 'axios';
import Cookies from 'js-cookie';
import { Image } from "react-bootstrap";
import LocationInfo from './LocationInfo';
// import Masonry, {ResponsiveMasonry} from "react-responsive-masonry";

class Posts extends React.Component{
    
    constructor()
    {
        super()
        this.state={
            posts:[]
        }
        
    }

    
    componentDidMount()
    {
        const user = Cookies.getJSON("user");
        return axios.get('//api.helplinekerala.com/get_posts.php',{
            params: {
                user_id:user.id
            }
        })
        .then( response =>{
            // handle success
            // console.log(response.data);
            this.setState({
                posts:response.data
            });
            localStorage.setItem("postCollection", JSON.stringify(response.data));
            // console.log("then :",this.state);
        })
        .catch(function (error) {
            // handle error
            if (!navigator.onLine) {

                let postCollection = localStorage.getItem('postCollection');
                // console.warn(postCollection);
                this.setState({
                    posts:JSON.parse(postCollection)
                });
                
            }
            // console.log(error);
            // console.warn("catch :",this.state);
        });

        
        
    }
    
    render(){
        var postItems = this.state.posts.map((post, i) =>
            <div className="col-sm-6 col-lg-4 mb-4" key={i}>
                <div className="card">
                {(post.image_video)? 
                // <svg className="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="https://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">{post.image_video}</text></svg>
                <Image width="100%" height="auto" className="img-fluid" src={post.path}/>: ""}

                    <div className="card-body">
                    <p className="card-text">{post.message}</p>
                    <p className="card-text"><small>Created At {moment(post.post_date+' '+post.post_time, "DD-MM-YYYY hh:mm:ss a").fromNow()}</small></p>
                    {/* <p className="card-text"><small className="text-muted">latitude:{post.latitude} longitude:{post.longitude}</small></p> */}
                    <p className="card-text">
                        <small style={{float: "left"}}>Views:{post.view_list}</small>
                        <i style={{float: "right"}}>{post.verified_user}</i>
                    </p>
                    </div>
                
                    <div className="border-top d-flex card-footer">
                        <div className="card-post__author d-flex">
                            {/* <p> <Image className="card-post__author-avatar card-post__author-avatar--small" scr="//api.helplinekerala.com/profile/post-icon.png" /></p> */}
                            {/* <Image className="card-post__author-avatar" scr="//api.helplinekerala.com/profile/post-icon.png" roundedCircle/> */}
                            <div className="d-flex flex-column justify-content-center ml-3"> 
                                <span className="card-post__author-name">{post.user_name}</span>
                                <small>{post.post_date}</small>
                            </div>
                        </div>
                        <div className="my-auto ml-auto">
                            {/* <button className="btn btn-white btn-sm"> */}
                                <i className="far fa-bookmark mr-1"></i> 
                                <LocationInfo lat={post.latitude} lon={post.longitude}/>
                            {/* </button> */}
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
export default Posts
import React from 'react';
import axios from 'axios';
import Cookies from 'js-cookie';
import toastr from 'toastr';
class Addpost extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            message : '',
            type : '',
            assets : '',
            fileType:'',
            all : '',
            police : '',
            fire_force : '',
            rapid_force : '',
            medical : '',
            finance : '',
            gov_authority : '',
            common_citizen : '',
            latitudeValue : '',
            longitudeValue : ''
        }
        this.user = JSON.parse(Cookies.get('user'));
        this.uploadData = this.uploadData.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
    }
    componentDidMount() {
        navigator.geolocation.getCurrentPosition((position)=> {
            let lat=position.coords.latitude;
            let lon=position.coords.longitude;
            this.setState({ 
                latitudeValue : lat,
                longitudeValue : lon
            });
        });
        if("geolocation" in navigator)
            toastr.success("Location are available");
        else
            toastr.primary("Location not available");
    }
    assetsSelect = (e) => {
        this.setState({
            assets:e.target.files[0],
            type:e.target.files[0].type.split('/')[0],
            fileType:e.target.files[0].type.split('/')[1]
        })
    }
    inputSet = (e)=>{
        this.setState({ [e.target.name] : (e.target.value)});
    }
    inputCheckBox=(e)=>{
        const name =e.target.name;
        const value = e.target.type === 'checkbox' ? e.target.checked : e.target.value;
        if(name === 'all' && value === true){
            this.setState({
                all : true,
                police : true,
                fire_force : true,
                rapid_force : true,
                medical : true,
                finance : true,
                gov_authority : true,
                common_citizen : true
            });
        }else if(name === 'all' && value === false){
            this.setState({
                all : false,
                police : false,
                fire_force : false,
                rapid_force : false,
                medical : false,
                finance : false,
                gov_authority : false,
                common_citizen : false
            });
        }else{
            this.setState({ [name] : (value)});
            if((name === 'police' || name === 'fire_force' || name === 'rapid_force' || name === 'medical' || name === 'finance' || name === 'gov_authority' || name === 'common_citizen') && value ===false){
                this.setState({all:false});
            }else {
                switch (name) {
                    case 'police':
                        if(value === true){
                            if((this.state.fire_force && this.state.rapid_force && this.state.medical && this.state.finance &&  this.state.gov_authority && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'fire_force':
                        if(value === true){
                            if((this.state.police && this.state.rapid_force && this.state.medical && this.state.finance && this.state.gov_authority && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'rapid_force':
                        if(value === true){
                            if((this.state.fire_force && this.state.police && this.state.medical && this.state.gov_authority && this.state.finance && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'finance':
                        if(value === true){
                            if((this.state.fire_force && this.state.rapid_force && this.state.police && this.state.medical && this.state.gov_authority && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'medical':
                        if(value === true){
                            if((this.state.fire_force && this.state.rapid_force && this.state.police && this.state.finance && this.state.gov_authority && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'gov_authority':
                        if(value === true){
                            if((this.state.fire_force && this.state.rapid_force && this.state.medical && this.state.finance && this.state.police && this.state.common_citizen)===true){
                                this.setState({all:true});
                            }
                        }
                    break;
                    case 'common_citizen':
                    if(value === true){
                        if((this.state.fire_force && this.state.rapid_force && this.state.medical && this.state.finance && this.state.gov_authority && this.state.police)===true){
                            this.setState({all:true});
                        }
                    }
                    break;
                    default:
                        if((this.state.police && this.state.fire_force && this.state.rapid_force && this.state.medical && this.state.finance && this.state.gov_authority && this.state.common_citizen)===true){
                            this.setState({all:true});
                        }
                    break;
                }
            }
        }
    }
    onSubmit=(e)=>{
        e.preventDefault();
        if(this.state.latitudeValue !=='' || this.state.longitudeValue !==''){
            this.uploadData();
        }
        else{
            toastr.error("Location Not Found");
        }
    }
    uploadData=()=>{
        const formData = new FormData();
        formData.append('user_id',this.user.id)
        formData.append('assets',this.state.assets)
        formData.append('type',this.state.type)
        formData.append('fileType',this.state.fileType)
        formData.append('message',this.state.message)
        formData.append('latitudeValue',this.state.latitudeValue)
        formData.append('longitudeValue',this.state.longitudeValue)
        formData.append('allUser',this.state.all)
        formData.append('commonCitizen',this.state.common_citizen)
        formData.append('police',this.state.police)
        formData.append('fireForce',this.state.fire_force)
        formData.append('rapidForce',this.state.rapid_force)
        formData.append('medicalRelated',this.state.medical)
        formData.append('financeRelated',this.state.finance)
        formData.append('govAuthority',this.state.gov_authority)
        axios.post('//api.helplinekerala.com/add_post.php', formData,{
            headers: {
                'content-type': 'multipart/form-data'
            }
        }).then(response=>{
            if(response.data.status){
                window.location.replace("../app");
            }
        });
    }
    render(){
        return(
            <div className="container">
                <form className="form-group" onSubmit={ this.onSubmit }>
                    <div className="form-group">
                        <label htmlFor="message">Enter your message</label><br/>
                        <textarea cols="110" onChange={this.inputSet} className="form-control" placeholder="Type your message" id="message" autoFocus autoComplete name="message"></textarea>
                    </div>
                    <div className="form-group">
                        <label htmlFor="assets">Image</label><br/>
                        <input type="file" accept="image/*,audio/*,video/*" ref="inputFile" onChange={this.assetsSelect} id="assets" name="assets"/>
                    </div>
                    <div className="form-group">
                        <label htmlFor="viewList">Who can see this post</label><br/>
                        <div id="viewList" className="form-group">
                            <label htmlFor="all">
                                <input type="checkbox" checked={this.state.all} onClick={this.inputCheckBox} placeholder="All" id="all" value="All" name="all"/>
                                All
                            </label><br/>
                            <label htmlFor="police">
                                <input type="checkbox" checked={this.state.police} onClick={this.inputCheckBox} placeholder="Police" id="police" value="Police" name="police"/>
                                Police
                            </label><br/>
                            <label htmlFor="fire_force">
                                <input type="checkbox" checked={this.state.fire_force} onClick={this.inputCheckBox} placeholder="Fire force" id="fire_force" value="Fire force" name="fire_force"/>
                                Fire force
                            </label><br/>
                            <label htmlFor="rapid_force">
                                <input type="checkbox" checked={this.state.rapid_force} onClick={this.inputCheckBox} placeholder="Rapid force" id="rapid_force" value="Rapid force" name="rapid_force"/>
                                Rapid force
                            </label><br/>
                            <label htmlFor="medical">
                                <input type="checkbox" checked={this.state.medical} onClick={this.inputCheckBox} placeholder="Medical" id="medical" value="Medical Related" name="medical"/>
                                Medical Related
                            </label><br/>
                            <label htmlFor="medical">
                                <input type="checkbox" checked={this.state.finance} onClick={this.inputCheckBox} placeholder="Finance" id="finance" value="Finance Related" name="finance"/>
                                Finance Related
                            </label><br/>
                            <label htmlFor="gov_authority">
                                <input type="checkbox" checked={this.state.gov_authority} onClick={this.inputCheckBox} placeholder="Government Authority" id="gov_authority" value="Government Authority" name="gov_authority"/>
                                Government Authority
                            </label><br/>
                            <label htmlFor="common_citizen">
                                <input type="checkbox" checked={this.state.common_citizen} onClick={this.inputCheckBox} placeholder="Common Citizen" id="common_citizen" value="Common Citizen" name="common_citizen"/>
                                Common Citizen
                            </label>
                        </div>
                    </div>
                    <div className="form-group">
                        <button onClick={this.addPost} className="form-control btn btn-success">Post</button>
                    </div>
                </form>
            </div>
        );
    }
}
export default Addpost;
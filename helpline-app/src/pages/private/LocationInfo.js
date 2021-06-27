import React from 'react';
import axios from 'axios';

class LocationInfo extends React.Component{
    
    constructor()
    {
        super()
        this.state={
            location:[]
        }
        
    }

    
    componentDidMount()
    {
        return axios.get('https://us1.locationiq.com/v1/reverse.php',{
            params: {
                key:'pk.a776d8f9b82ca120d21cbbe7f9444bbe',
                lat:this.props.lat,
                lon:this.props.lon,
                format:'json'
            }
        })
        .then( response =>{
            // handle success
            // console.log(response.data.address.building,response.data.address.county);
            this.setState({location:response.data.address});
            
        })
        .catch(function (error) {
            // handle error
            // console.log(error);
        });


        
    }
    
    render(){
        return(
            <>
                {/* {this.state.location.building}
                , */}
                {this.state.location.county}
            </>
        )
    }
}
export default LocationInfo
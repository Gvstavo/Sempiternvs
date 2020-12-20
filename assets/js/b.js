import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import axios from 'axios';


// This site has 3 pages, all of which are rendered
// dynamically in the browser (not server rendered).
//
// Although the page does not ever refresh, notice how
// React Router keeps the URL up to date as you navigate
// through the site. This preserves the browser history,
// making sure things like the back button and bookmarks
// work properly.

class B  extends React.Component{

  constructor(props){
  
    super(props);
    this.state = {nav: []};
    //this.handleChangeNav = this.handleChangeNav.bind(this);


  }


  // componentDidMount(){

  //   let r = '/api/thread/' + "b";
  //   let ret =  axios.get(r).then(function (response) {
  //     this.handleChangeNav(response);
  //   }.bind(this))

  // }

  // handleChangeNav(event){
  //   this.setState({nav: event.data});
  //    console.log(this.state.nav);
  // }

  render(){

    return(
      <>

        <h1>real negros horas</h1>

      </>
    );
  }
}

export default B;
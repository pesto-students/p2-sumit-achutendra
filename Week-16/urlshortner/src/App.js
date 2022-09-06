import { useEffect, useState } from 'react';
import './App.css';
import InputShortner from './InputShortner';
import LinkResult from './LinkResult';
import ReactGA from "react-ga";

const TRACKING_ID = "UA-240000646-1";
ReactGA.initialize(TRACKING_ID);

function App() {

  useEffect(() => {
    ReactGA.pageview(window.location.pathname);
  },[]);

  const [inputValue , setInputValue] = useState("");


  return (
    <div className="container">
      <InputShortner setInputValue={setInputValue}/>
      <LinkResult inputValue={inputValue} />
      
    </div>
  );
}

export default App;
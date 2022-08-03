import { useState } from 'react';
import './App.css';
import InputShortner from './InputShortner';
import LinkResult from './LinkResult';

function App() {
  const [inputValue , setInputValue] = useState("");


  return (
    <div className="container">
      <InputShortner setInputValue={setInputValue}/>
      <LinkResult inputValue={inputValue} />
      
    </div>
  );
}

export default App;
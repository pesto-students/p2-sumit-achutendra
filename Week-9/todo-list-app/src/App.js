import React, { useState } from 'react';
import './style.css';
import Header from "./component/header";
import CreateArea from './component/CreateArea';
import Note from './component/note';
import Count from './component/Count';


function App(props) {
  const [notes , setNotes] = useState([])


  function addNote(newNote){
    setNotes((preValue) => {
      return [...preValue, newNote];
    });
  }

  function deleteNotes(id){
    setNotes((preValue) => {
      return [...preValue.filter((note , index) => index !== id)];
    });

  }

  return (
    <div className='App'>
      <Header />
      <Count count={notes.length === 0 
                    ? "Empty" 
                    : `Showing ${notes.length} Notes in Database`
                  }
       />

      <CreateArea onAdd={addNote}/>
      {notes.map((note, index) => (
        <Note 
          key={index}
          id={index}
          title={note.title}
          content={note.content}
          onDelete={deleteNotes}
        />
      ))}
    </div>
  );
}

export default App;

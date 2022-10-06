import React from 'react';
import { Routes, Route } from 'react-router-dom';
import './App.css';
import Home from './views/Home';
import Login  from './views/Login';
import Todo from './views/Todo';
import 'dracula-ui/styles/dracula-ui.css'

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path='/' element={<Home />} />
        <Route path='/app/tasks' element={<Todo />} />
        <Route path='/login' element={<Login />} />
      </Routes>
    </div>
  );
}

export default App;

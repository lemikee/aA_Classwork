import React from 'react';
import TodoListContainer from './todos/todo_list_container';

const App = () => {
  return (
    <div className="app">
      <h1>Todos App</h1>
      <TodoListContainer />
    </div>
  );
};

export default App;
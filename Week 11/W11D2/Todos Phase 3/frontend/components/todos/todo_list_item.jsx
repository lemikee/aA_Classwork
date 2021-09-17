import React from 'react';
import TodoListContainer from './todo_list_container';

const TodoListItem = (props) => {
  return (
    <div>
      <li>
        {
          props.todo.title
        }
      </li>
    </div>
  );
};

export default TodoListItem;
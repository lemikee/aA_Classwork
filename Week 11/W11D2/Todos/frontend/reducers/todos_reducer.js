import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions";

// const todosReducer = (state = {}, action) => { // takes in two args, (previous) state and action being dispatched
//   Object.freeze(state); // Object.freeze makes it so the (previous) state is immutate
//   const newState = Object.assign({}, state);

//   switch (action.type) { // taking arr data and making example in todo_actions
//     case RECEIVE_TODOS:
//       action.todos.forEach(todo => {
//         newState[todo.action] = todo;
//       });
//       return newState;
//   }

// };

const todosReducer = (state = {}, action) => {
  switch (action.type) {
    default:
      return state;
  }
};

export default todosReducer;
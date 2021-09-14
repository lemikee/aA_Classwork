import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions";
// const initialState = {
//   1: {
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   },
//   2: {
//     id: 2,
//     title: "wash dog",
//     body: "with shampoo",
//     done: true
//   }
// };

// const todosReducer = (newState = initialState, action) => { // takes in two args, (previous) state and action being dispatched
//   // Object.freeze(state); // Object.freeze makes it so the (previous) state is immutate
//   // const newState = Object.assign({}, state);

//   switch (action.type) { // taking arr data and making example in todo_actions
//     case RECEIVE_TODOS:
//       action.todos.forEach(todo => {
//         newState[todo.action] = todo;
//       });
//       return newState;
//   }

// };


// const todosReducer = (state = initialState, action) => {
//   //...
// };

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


// const todosReducer = (state = initialState, action) => {
//   Object.freeze(state)
//   switch (action.type) {
//     default:
//       return state;
//   }
// };

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = Object.assign({}, state)
  switch (action.type) { // taking arr data and making example in todo_actions
    case RECEIVE_TODOS:
      action.todos.forEach(todo => {
        newState[todo.action] = todo;
      });
      return newState;
    case RECEIVE_TODO:
    // Make a new object setting a single key value pair for action.todo
    // Return a new state object by merging your previous state and your
    // new object
       newState[action.todo.id] = action.todo
      return newState
    default:
      return state;
  }
};

export default todosReducer;
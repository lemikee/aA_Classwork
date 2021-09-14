export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = todos => ({
    type: RECEIVE_TODOS, //todos object
    todos,
});

export const receiveTodo = todo => ({
    type: RECEIVE_TODO,
    todo,
});

export const removeTodo = todo => ({
    type: REMOVE_TODO,
    todo,
});



// const initialState = {
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     }
//   };


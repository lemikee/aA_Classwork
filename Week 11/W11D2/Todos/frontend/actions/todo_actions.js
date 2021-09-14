export const RECEIVE_TODOS = 'RECEIVE_TODOS'
export const RECEIVE_TODO = 'RECEIVE_TODO'

export const recieveTodos = todos => ({
    type: RECEIVE_TODOS, //todos object
    todos,
})

export const recieveTodo = todo => ({
    type: RECEIVE_TODO,
    todo,
})

// example:
// {
//   1: {
//     id: 1,
//       title: 'wash car',
//         body: 'with soap',
//           done: false;
//   },
//   2: {
//     id: 2,
//       title: 'wash dog',
//         body: 'with shampoo',
//           done: true;
//   },
// };

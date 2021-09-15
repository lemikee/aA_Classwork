import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from "../actions/step_actions";

const initialState = {
  1: { // this is the step with id = 1
    id: 1,
    title: 'walk to store',
    done: false,
    todo_id: 1
  },
  2: { // this is the step with id = 2
    id: 2,
    title: 'buy soap',
    done: false,
    todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = Object.assign({}, state);

  switch (action.type) { // taking arr data and making example in todo_actions
    case RECEIVE_STEPS:
      action.steps.forEach(step => {
        newState[step.action] = step;
      });
      return newState;
    case RECEIVE_STEP:
      // Make a new object setting a single key value pair for action.todo
      // Return a new state object by merging your previous state and your
      // new object
      newState[action.step.id] = action.step;
      return newState;
    default:
      return state;
    case REMOVE_STEP:
      delete newState[action.step.id];
      return newState;
  }
};

export default stepsReducer;

const newSteps = [
  { id: 1, title: 'Dispatch actions', done: false, todo_id: 1 },
  { id: 2, title: 'Dispatch more actions', done: false, todo_id: 2 }
];


// const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, ...etc }, ...etc];
// const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, ...etc }, ...etc];
// store.dispatch(receiveTodos(newTodos));
// store.dispatch(receiveSteps(newSteps));
// store.getState(); // should return only the new todos and steps

// store.dispatch(receiveTodo({ id: 3, title: "New Todo" ...etc }));
// store.dispatch(receiveStep({ id: 3, title: "New Step", todo_id: 2 done: false ...etc }));
// store.getState(); // should include the newly added todo and step

// store.dispatch(receiveTodo({ id: 3, title: "Newer Todo" ...etc }));
// store.dispatch(receiveStep({ id: 3, title: "Newer Step", done: true ...etc }));
// store.getState(); // should update the previously added todo and step

// store.dispatch(removeTodo({ id: 3, title: "Newer Todo" ...etc }));
// store.dispatch(removeStep({ id: 3, title: "Newer Step" ...etc }));
// store.getState(); // should not include the previously added todo

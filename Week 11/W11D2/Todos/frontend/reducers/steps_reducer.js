import { RECEIVE_STEPS, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

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
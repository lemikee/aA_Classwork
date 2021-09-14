import configureStore from "./frontend/store/store";
import { receiveTodo, receiveTodos, removeTodo } from "./frontend/actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./frontend/actions/step_actions";





document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.store = store;
  console.log("Welcome to your todo list!");
});
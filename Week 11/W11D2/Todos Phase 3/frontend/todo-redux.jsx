import configureStore from "./store/store";
import React from "react";
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from "./actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./actions/step_actions";
import App from "./components/app";
import Root from './components/root';
import allTodos from './reducers/selectors'


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;

  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.allTodos = allTodos;

  const main = document.getElementById('main');
  ReactDOM.render(<Root store={store}/>, main);
  
  console.log("Welcome to your todo list!");
});



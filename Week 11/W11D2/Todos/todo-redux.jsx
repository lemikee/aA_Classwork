import configureStore from "./frontend/store/store";
import React from "react";
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from "./frontend/actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./frontend/actions/step_actions";
import App from "./frontend/components/app";
import Root from './frontend/components/root';



document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;

  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;

  const main = document.getElementById('main');
  ReactDOM.render(<Root store={store}/>, main);

  console.log("Welcome to your todo list!");
});



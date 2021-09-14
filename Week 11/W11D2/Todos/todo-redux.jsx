import configureStore from "./frontend/store/store";
import { recieveTodos, recieveTodo } from "./frontend/actions/todo_actions";




document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  window.recieveTodo = recieveTodo;
  window.recieveTodo = recieveTodo;
  window.store = store;
  console.log("Welcome to your todo list!");
});
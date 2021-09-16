import React from 'react';
import { unique_id } from '../../util/unique_id'

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            title: '',
            body: '',
            done: false
        }
        this.handleSubmit = this.handleSubmit.bind(this)
        this.updateTitle = this.updateTitle.bind(this)
        this.updateBody = this.updateBody.bind(this)
        // this.updateDone= this.updateDone.bind(this)
    }

    updateTitle(e) {
        this.setState({ title: e.target.value});
      }

      updateBody(e) {
        this.setState({ body: e.target.value});
      }


  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: unique_id()})
    this.props.receiveTodo(todo) 
    this.setState({
      title: '',
      body: ''
    })
  }

  render() {
      return (
          <form className = "todo-form" onSubmit={this.handleSubmit}>
              <label>Title:
                  <input
                type=text
                name=title 
                value={this.state.title}
                onChange={this.updateTitle}
                />
              </label>
              <label>Body:
                  <input>
              type=text
                name=body
                value={this.state.body}
                onChange={this.updateBody}
                </input>
              </label>
              <button>Submit</button>
          </form>
      )
  }
}

export default TodoForm

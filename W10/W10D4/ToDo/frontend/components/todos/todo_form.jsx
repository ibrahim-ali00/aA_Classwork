import React from "react";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
      id: Math.floor(Math.random() * 1000000),
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateDone = this.updateDone.bind(this)
  }

  componentDidMount() {}

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state);
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: "",
      done: false,
      id: Math.floor(Math.random() * 1000000),
    });
  
  }

  updateTitle(e) {
    this.setState({title: e.target.value})
  }

  updateBody(e) {
      this.setState({body: e.target.value})
  }

  updateDone(e) {
    this.setState({done: e.target.value})
  }

  render() {
    // console.log(this.state)
    return (
        <form onSubmit={ this.handleSubmit} >
            <h4>Add an Item</h4>
            <label>
                Title:
                 <input type="text" value={this.state.title} onChange={this.updateTitle}/>
            </label>
            <label>
                Body:
                 <input type="text" value={this.state.body} onChange={this.updateBody}/>
            </label>
            
              Done:
              <label htmlFor="title">True:</label>
              <input id="title" type="radio" value="true" onChange={this.updateDone} checked={this.state.done === "true"}/>
              
              <label>
              False:
              <input type="radio" value="false" onChange={this.updateDone} checked={this.state.done === "false"}/>
            </label>
            <input type="submit" value="Add Item!" />
        </form>
    )
}
}

export default TodoForm;

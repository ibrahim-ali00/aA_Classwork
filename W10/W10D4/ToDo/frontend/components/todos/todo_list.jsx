import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

// export default () => <h3>Todo List goes here!</h3>;

export default (props) => {
  return (
    <div>
      <h3>Todo List</h3>
      <ul className="todo_list">
        {props.todos.map((ele) => (
          <TodoListItem
            key={ele.id}
            title={ele.title}
            body={ele.body}
            done={ele.done}
          />
        ))}
        <TodoForm receiveTodo={props.receiveTodo} />
      </ul>
    </div>
  );
};

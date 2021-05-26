export const allTodos = (state) => {
  const todosArr = Object.values(state.todos);
  return todosArr;
};

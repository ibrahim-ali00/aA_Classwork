export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}

export const selectPokemonMovesNames = (state) => {
  return names = Object.values(state.entities.moves).map(moveObj => {
    return moveObj.name;
  });

}
  
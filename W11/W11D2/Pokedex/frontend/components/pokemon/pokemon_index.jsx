import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon()
  }

  render() {
    const poke = this.props.pokemon;

    return (
      <ul>
        {poke.map((pokemon) => {
          return <li key={pokemon.id} className='pokemon-index-item'>
            <span>{pokemon.id}</span>
            <img src={pokemon.imageUrl}></img>
            <span>{pokemon.name}</span>
          </li>
        })}

      </ul>
    )
  }

}

export default PokemonIndex;
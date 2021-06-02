import React, { useLayoutEffect } from "react";
import { Render } from "react-dom";
import { Route } from "react-router-dom";

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokeId !== this.props.match.params.pokeId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }
  }

  render() {
    return (
      <div className="pokemon-detail">
        <img src={this.props.pokemon.imageUrl} />
        <ul>
          <li>{this.props.pokemon.name}</li>
          <li>{this.props.pokemon.pokeType}</li>
          <li>{this.props.pokemon.attack}</li>
          <li>{this.props.pokemon.defense}</li>
        </ul>
      </div>
    );
  }
}

export default PokemonDetail;

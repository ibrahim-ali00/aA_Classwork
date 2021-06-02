import { connect } from "react-redux";
import { selectPokemonMovesNames } from "../../reducers/selectors";
import { requestSinglePokemon } from "./../../actions/pokemon_actions";
import PokemonDetail from "./pokemon_detail";

const mapStateToProps = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.pokeId],
  moves: selectPokemonMovesNames(state)
});

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (pokeId) => dispatch(requestSinglePokemon(pokeId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);

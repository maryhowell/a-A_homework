import { connect } from 'react-redux';
import PokemonIndex from "./pokemon_index";
// actions
import {selectAllPokemon} from "../../reducers/selectors";
import { requestAllPokemon } from "../../actions/pokemon_actions";
// import PokemonIndexItem from './pokemon/pokemon_index_item';



const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  // dispatch requestAllPokemon action.
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);

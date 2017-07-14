import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON }
from '../actions/pokemon_actions';
import { merge } from 'lodash';

const _default = {entities: {}};


const pokemonReducer = (state = _default, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      nextState = merge({}, state, {entities: action.pokemon});
      return nextState;
    case RECEIVE_SINGLE_POKEMON:

       const poke = action.pokemon; //action.payload.pokemon
       return merge({}, state, {
         entities: { [poke.id]: poke },
         currentPoke: poke.id
       });
    default:
      return state;
}};

export default pokemonReducer;

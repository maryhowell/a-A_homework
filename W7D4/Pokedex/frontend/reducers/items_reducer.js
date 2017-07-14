import { RECEIVE_SINGLE_POKEMONS_ITEMS } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const itemReducer = (state = [], action) => {


  switch(action.type){
    case RECEIVE_SINGLE_POKEMONS_ITEMS:
       return action.items; //action.payload.pokemon
    default:
      return state;
}};

export default itemReducer;

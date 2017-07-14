export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_SINGLE_POKEMONS_ITEMS = "RECEIVE_SINGLE_POKEMONS_ITEMS";
// import {fetchAllPokemon} from '../util/api_util';
import * as APIUtil from '../util/api_util';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = pokemon => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const receivePokemonItems = items => ({
  type: RECEIVE_SINGLE_POKEMONS_ITEMS,
  items
});


// async actions
export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = (id) => (dispatch) => {
  return APIUtil.fetchSinglePokemon(id)
    .then(data => {
      dispatch(receiveSinglePokemon(data.poke));
      dispatch(receivePokemonItems(data.items));
    });
};




// window.receiveAllPokemon = receiveAllPokemon;

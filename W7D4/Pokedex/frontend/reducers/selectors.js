import { values } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => values(pokemon.entities);

export const selectSinglePokemon = ({entities}, id) => (entities[id] || {});

export const selectPokemonItem = ({ pokemonDetail }, itemId) => {
  const foundItem = pokemonDetail.items.find(item => item.id === itemId);
  return foundItem || {};
};

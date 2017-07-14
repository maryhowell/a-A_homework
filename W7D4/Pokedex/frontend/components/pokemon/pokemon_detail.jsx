import React from 'react';
import merge from 'lodash/merge';
import { requestSinglePokemon } from "../../actions/pokemon_actions";
import PokemonDetailItem from './pokemon_detail_item';
import PokemonIndexItem from './pokemon_index_item';
import Route from 'react-router-dom';




class PokemonDetail extends React.Component {
  componentDidMount() {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }
  componentWillReceiveProps(nextProps) {
  if (this.props.match.params.pokemonId !== nextProps.match.params.pokemonId) {
    this.props.requestSinglePokemon(nextProps.match.params.pokemonId);
  }
}
  render() {
    const { pokemon, items } = this.props;
    console.log(items);
    return (
      <section className="pokemon-detail">
        <figure>
          <img src={pokemon.image_url} alt={pokemon.name} />
        </figure>
        <ul>
          <li>
            <h2>{pokemon.name}</h2>
          </li>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>

        </ul>
        <section className="toys">
          <h3>Items</h3>
          <ul className="toy-list">
            {items.map(item => <PokemonDetailItem key={item.name} item={item} />)}
          </ul>
        </section>


      </section>
    );
  }
}

export default PokemonDetail;

// <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />

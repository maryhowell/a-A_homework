import React from 'react';
import { Link } from 'react-router-dom';

const PokemonDetailItem = ({ item }) => (
  <li className="pokemon-items">
      <span> { item.id } </span>
      <img src={item.image_url} alt={item.name} />
      <span> { item.name } </span>
      <span> { item.price } </span>
      <span> { item.happiness } </span>
  </li>
);

export default PokemonDetailItem;

import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter, Route } from 'react-router-dom';
// import PokemonIndexItem from './pokemon/pokemon_index_item';
import PokemonIndex from  './pokemon/pokemon_index_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <Route path='/' component={ PokemonIndex } />
    </HashRouter>
  </Provider>
);

export default Root;

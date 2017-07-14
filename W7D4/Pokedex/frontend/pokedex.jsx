import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';


// //Testing
import {fetchAllPokemon} from './util/api_util';
import {receiveAllPokemon, requestAllPokemon, requestSinglePokemon} from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';


document.addEventListener("DOMContentLoaded", ()=> {
  const store = configureStore();
  window.store = store;
  window.requestSinglePokemon = requestSinglePokemon;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
});

// window.dispatch = store.dispatch;
// window.getState = store.getState;

// window.selectAllPokemon = selectAllPokemon;
// window.receiveAllPokemon = receiveAllPokemon;
// window.requestAllPokemon = requestAllPokemon;

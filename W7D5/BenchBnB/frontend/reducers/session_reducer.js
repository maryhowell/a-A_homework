import { RECEIVE_CURRENT_USER,
         RECEIVE_LOGOUT_SUCCESS,
         RECEIVE_ERRORS }
         from '../actions/session_actions';

import merge from 'lodash/merge';

const _nullUser = Object.freeze{
  currentUser: null,
  errors: []
};

const SessionReducer = function(state = _nullUser,action){

  switch(action.type){
    Object.freeze(state)
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
    return merge({}, nullUser, {
      currentUser
    });
    case RECEIVE_ERRORS:
      const errors = action.errors;
    return merge({}, nullUser, {
      errors
    });
    default:
      return state;
  }
};

export default SessionReducer;

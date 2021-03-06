import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState,
    applyMiddleware(addLoggingToDispatch, addSwag));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log('old state: ', store.getState());
  console.log('action: ', action);
  next(action);
  console.log('new state: ', store.getState());
};

const addSwag = store => next => action => {
  console.log('swag');
  next(action);
};

export default configureStore;

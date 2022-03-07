Rails.application.routes.draw do
  root "pokemons#index"

  get "/pokemon", to: "pokemons#show"
end

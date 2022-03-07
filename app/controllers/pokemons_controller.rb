class PokemonsController < ApplicationController
  def show
    @pokemon = Poke::Api.fetch(params[:name])
  end
end

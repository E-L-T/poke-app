class PokemonsController < ApplicationController

  def index
  end

  def show
    @pokemon = Poke::Api.fetch(params[:name])
    unless @pokemon
      flash.now[:notice] = 'Je ne connais pas ce Pokemon'
    end
  end
end

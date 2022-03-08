class PokemonsController < ApplicationController

  def index
  end

  def show
    if valid_params(params[:name])
      @pokemon = Poke::Api.fetch(params[:name])
    else
      redirect_to root_path and return
    end

    unless @pokemon
      flash.now[:notice] = 'Je ne connais pas ce Pokemon'
    end
  end

  private

  def valid_params(name)
    if name.blank?
      flash[:notice] = 'Tu dois entrer un nom de Pokemon'
      false
    elsif name.length > 100
      flash[:notice] = 'Ce nom de Pokemon est trop long'
      false
    else
      true
    end

  end
end

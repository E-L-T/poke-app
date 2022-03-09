require 'rails_helper'

RSpec.describe PokemonsController do

  describe 'describe "get #index" do' do
    render_views

    it 'displays index page' do
      get :index

      assert_response :success

      expect(response.body).to(include('Bienvenue sur la PokéApp !'))
    end
  end

  describe 'describe "get #show" do' do
    render_views

    context 'success' do
      it 'fetches pokemon data' do
        get :show,
          params: {
            name: 'ditto'
          }

        expect(response.body).to(include('https://pokeapi.co/api/v2/pokemon-species/132/'))
      end
    end

    context 'error' do
      it 'returns error message if pokemon does not exist' do
        get :show,
          params: {
            name: 'pikachouchou'
          }

        expect(response.body).to(include('Je ne connais pas ce Pokemon'))
      end

      it 'returns error message if no name params submitted' do
        get :show,
          params: {
            name: nil
          }

        expect(flash[:notice]).to match(/Tu dois entrer un nom de Pokemon*/)
      end

      it 'returns error message if name params is longer than 100 characters' do
        get :show,
          params: {
            name: "qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm"
          }

        expect(flash[:notice]).to match(/Ce nom de Pokemon est trop long*/)
      end
    end
  end
end

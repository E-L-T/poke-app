module Poke::API
  def self.fetch(params)
    url = "https://pokeapi.co/api/v2/pokemon/#{params}"
    response = Faraday.get(url)
    response_body = JSON.parse(response.body)
  end
end

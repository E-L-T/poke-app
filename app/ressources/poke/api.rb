module Poke::Api
  def self.fetch(params)
    url = "https://pokeapi.co/api/v2/pokemon/#{params.downcase}"
    response = Faraday.get(url)
    if response.status == 200
      JSON.parse(response.body)
    else
      nil
    end
  end
end

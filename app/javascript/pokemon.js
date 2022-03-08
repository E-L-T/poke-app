document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#pokemon-data-field')) {
    let pokemonDataField = document.querySelector('#pokemon-data-field')

    let pokemonData = pokemonDataField.dataset.pokemon;

    let pokemonDataParsed = JSON.parse(pokemonData);

    let pokemonDataStringified = JSON.stringify(pokemonDataParsed, null, 4);

    pokemonDataField.innerHTML = pokemonDataStringified;
  }
});

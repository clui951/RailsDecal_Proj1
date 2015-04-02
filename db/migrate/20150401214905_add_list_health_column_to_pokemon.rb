class AddListHealthColumnToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :health, :integer
  end
end

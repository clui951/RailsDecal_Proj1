# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  level      :integer
#  trainer_id :integer
#  created_at :datetime
#  updated_at :datetime
#  health     :integer
#

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

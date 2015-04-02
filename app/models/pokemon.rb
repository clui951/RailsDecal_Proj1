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

class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates :name, presence: true 				# makes sure that a pokemon that is saved to database has a name filled in
	validates :name, uniqueness: true 			# makes sure that the name is unique
end

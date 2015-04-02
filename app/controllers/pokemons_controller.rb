class PokemonsController < ApplicationController

def capture
	pokemon = Pokemon.find(params[:id])
	pokemon.trainer_id = current_trainer.id
	pokemon.save
	flash[:pokemoncaught] = "You Caught "
	flash[:pokemoncaught] << pokemon.name
	redirect_to root_path
end

def damage
	pokemon = Pokemon.find(params[:poke_id])
	pokemon.health = pokemon.health - 10
	if pokemon.health <= 0
		flash[:death] = pokemon.name
		flash[:death] << " has died!"
		pokemon.destroy
	else
		flash[:damage] = pokemon.name
		flash[:damage] << " took damage!"
		pokemon.save
	end
	redirect_to trainer_path(params[:trainer]) 				# controller will go to prefix "trainer" and extract id from params[:trainer]
end


def new
	@pokemon = Pokemon.new 									# need to create a @pokemon for simple form to fill out
end

def create 													# run when post request made from simple_form
	@pokemon = Pokemon.create(user_params)
	@pokemon.level = 1
	@pokemon.health = 100
	@pokemon.trainer_id = current_trainer.id
	if @pokemon.save 		# if saving the new pokemon was successful (aka has name and not repeated)
		redirect_to trainer_path(id: current_trainer.id)
	else
		flash[:error] = @pokemon.errors.full_messages 		# if @pokemon.save failed, there must be some error assosciated with @pokemon
															# save errors into flash[:error], which will only be available temporarily in the next page
		redirect_to new_path
	end
end


private

def user_params 											
	params.require(:pokemon).permit(:name)		
	# check the pokemon model's {validates :name} ; require that pokemon's :name validations pass
	# name is a attribute/column of pokemon
end


end
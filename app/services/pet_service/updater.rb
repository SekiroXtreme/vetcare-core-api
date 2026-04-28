module PetService
  class Updater < ApplicationService
    def initialize(pet, params)
      @pet = pet
      @pet_params = params
    end

    def call
      @pet.update!(@pet_params)
      @pet
    end
  end
end

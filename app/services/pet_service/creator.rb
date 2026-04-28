module PetService
  class Creator < ApplicationService
    def initialize(params)
      @pet_params = params
    end

    def call
      @pet = Pet.create!(@pet_params)
      success(pet: @pet)
    end
  end
end

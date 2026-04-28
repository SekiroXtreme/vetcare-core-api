module Api::V1
  class PetsController < Api::BaseController
    before_action :set_pet, only: [ :show, :update, :destroy ]

    def index
      pets = Pet.all
      resource_response(pets, serializer: PetBlueprint)
    end

    def show
      resource_response(@pet, serializer: PetBlueprint)
    end

    def create
      validated = PetContract.call!(pet_params.to_h)
      result = PetService::Creator.call(validated)
      resource_response(result.pet, serializer: PetBlueprint, status: :created)
    end

    def update
      validated = PetContract.call!(pet_params.to_h)
      result = PetService::Updater.call(@pet, validated)
      resource_response(result.pet, serializer: PetBlueprint)
    end

    def destroy
      @pet.destroy!
      no_content_response
    end

    private

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :species, :breed, :age, :owner_id)
    end
  end
end

class PetContract < ApplicationContract
  params do
    required(:name).filled(:string)
    required(:species).filled(:string)
    required(:breed).filled(:string)
    required(:age).filled(:integer)
    required(:owner_id).filled(:integer)
  end
end

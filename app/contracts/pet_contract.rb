class PetContract < ApplicationContract
  params do
    required(:name).filled(:string)
    required(:species).filled(:string)
    required(:breed).filled(:string)
    required(:date_of_birth).filled(:integer)
    required(:weight).filled(:float)
    required(:owner_id).filled(:integer)
  end
end

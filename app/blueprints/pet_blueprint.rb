class PetBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :species, :breed, :date_of_birth, :weight, :owner_id
end

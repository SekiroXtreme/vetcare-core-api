class PetBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :species, :breed, :age, :owner_id
end

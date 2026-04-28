class PetsController < ApplicationController
  before_action :set_user

  def index
    @pets = @user.pets
  end

  def show
    @pet = @user.pets.find(params[:id])
  end

  def new
    @pet = @user.pets.build
  end


  def create
    @pet = @user.pets.build(pet_params)

    if @pet.save
      redirect_to user_pet_path(@user, @pet), notice: "Pet created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = @user.pets.find(params[:id])
  end

  def update
    @pet = @user.pets.find(params[:id])

    if @pet.update(pet_params)
      redirect_to user_pet_path(@user, @pet), notice: "Pet updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age)
  end
end

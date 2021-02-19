class DosesController < ApplicationController

  # A user can add a new dose (ingredient/description pair) to an existing cocktail
  # GET "cocktails/42/doses/new"
  # POST "cocktails/42/doses"

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    # A user can delete a dose that belongs to an existing cocktail.
    # DELETE "doses/25"
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params

    params.require(:dose).permit(:ingredient_id, :description)
    # ingredient/description pair
  end
end

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
      redirect_to
    else
      render :new
    end
  end

  def destroy
    # A user can delete a dose that belongs to an existing cocktail.
    # DELETE "doses/25"
  end

  private

  def dose_params
    params.require(:dose).permit()
    # ingredient/description pair
  end
end

class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end

  end



  private
  def dose_params
    params.require(:dose).permit(:name, :cocktail_id, :ingredient_id)
  end
end

class DosesController < ApplicationController
  def index
    @doses = Cocktail.doses.all
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail


    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

class DosesController < ApplicationController
  def index
    @doses = Cocktail.doses.all
  end

  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(Cocktail.find(params[:id]))
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end

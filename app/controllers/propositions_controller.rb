class PropositionsController < ApplicationController

  def index
    @propositions = Proposition.all
  end

  def new
    @proposition = Proposition.new
  end

  def create
    @proposition = Proposition.new(proposition_params)
    if @proposition.save
      redirect_to root_path, notice: 'You succesfull send proposition.'
    else
      render 'new'
    end
  end

  def destroy
    @proposition = Proposition.find(params[:id])
    @proposition.destroy
    redirect_to categories_path, notice: 'You reject this proposition'
  end

  def accept
    @categories = Category.all
    @proposition = Proposition.find(params[:id])
    @categories.to_a.push(@proposition.name)
  end

  private
  def proposition_params
    params.require(:proposition).permit(:name)
  end

end

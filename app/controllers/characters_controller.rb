class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character
    else
      render :new
    end
  end

  def show
    @last_fight_results = session[:last_fight_results] if session[:last_fight_results]
    session.delete(:last_fight_results)
    @character = Character.find(params[:id])
    @opponents = Character.where.not(id: @character.id)
    @opponents = @opponents.select do |opponent|
      ((opponent.lp - @character.lp).abs <= Character::MAX_LP_TRESHOLD &&  (opponent.attack - @character.attack).abs <= Character::MAX_ATK_TRESHOLD)
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    if @character.update(character_params)
      redirect_to @character
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    render :new
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end
end

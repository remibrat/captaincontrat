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
    @items = Item.all
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

    if params[:character][:equipped_weapon].present?
      equip_weapon(@character, params[:character][:equipped_weapon])
    end

    if params[:character][:equipped_shield].present?
      equip_shield(@character, params[:character][:equipped_shield])
    end

    if @character.update(character_params.except(:equipped_weapon, :equipped_shield))
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
    params.require(:character).permit(:name, :equipped_weapon, :equipped_shield)
  end

  def equip_weapon(character, weapon)
    if character.equipped_weapon.present?
      weapon = Item.find(params[:character][:equipped_weapon])

      if character.equipped_weapon != weapon
        character.equipped_weapon.unequip!(character)
      end
    end

    character_item = character.character_items.find_or_initialize_by(item_id: params[:character][:equipped_weapon])
    character_item.save!
  end

  def equip_shield(character, shield)
    if character.equipped_shield.present?
      shield = Item.find(params[:character][:equipped_shield])

      if character.equipped_shield != shield
        character.equipped_shield.unequip!(character)
      end
    end

    character_item = character.character_items.find_or_initialize_by(item_id: params[:character][:equipped_shield])
    character_item.save!
  end
end

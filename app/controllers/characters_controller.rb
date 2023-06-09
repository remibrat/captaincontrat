class CharactersController < ApplicationController
  def index
    @characters = Character.all
    @items = Item.all
    @fights = Fight.all.order(created_at: :desc).limit(10)

    @last_fight_results = session[:last_fight_results] if session[:last_fight_results]
    session.delete(:last_fight_results)
  end

  def new
    @character = Character.new
  end

  def create
    # if params[:character][:image].present?
    #   image = MiniMagick::Image.open(params[:character][:image].tempfile)
    #   image.resize '200x200'
    #   image.write params[:character][:image].tempfile
    # end

    @character = Character.new(character_params)

    if @character.save
      redirect_to characters_path
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
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
      redirect_to characters_path
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :lp, :attack, :defense, :equipped_weapon, :equipped_shield, :image)
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

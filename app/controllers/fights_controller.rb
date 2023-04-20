class FightsController < ApplicationController
  before_action :set_fight, only: %i[ show edit update destroy ]

  # GET /fights or /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1 or /fights/1.json
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
  end

  # GET /fights/1/edit
  def edit
  end

  # POST /fights or /fights.json
  def create
    @character = Character.find(params[:fight]['character_id'])
    @opponent = Character.find(params[:fight]['opponent_id'])

    @results = calculate_results(@character, @opponent)

    @fight = Fight.new(
      winner: @results['winner'],
      character: @character,
      opponent: @opponent
    )

    session[:last_fight_results] = @results

    respond_to do |format|
      if @fight.save
        format.html { redirect_to character_path(@character.id), notice: "Fight was successfully created." }
        format.json { render :show, status: :created, location: @fight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fights/1 or /fights/1.json
  def update
    respond_to do |format|
      if @fight.update(fight_params)
        format.html { redirect_to @fight, notice: "Fight was successfully updated." }
        format.json { render :show, status: :ok, location: @fight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1 or /fights/1.json
  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to fights_url, notice: "Fight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_params
      params.require(:fight).permit(:character, :opponent)
    end

    def calculate_results(character, opponent)
      results = {}

      if (opponent.lp / character.attack.to_f).ceil <= (character.lp / opponent.attack.to_f).ceil
        results['winner'] = character
        results['character_hits'] = (opponent.lp / character.attack.to_f).ceil
        results['opponent_hits'] = results['character_hits']
        results['lp_left'] = character.lp - (results['opponent_hits'] * opponent.attack)
      else
        results['winner'] = opponent
        results['opponent_hits'] = (character.lp / opponent.attack.to_f).ceil
        results['character_hits'] = results['opponent_hits']
        results['lp_left'] = opponent.lp - (results['character_hits'] * character.attack)
      end

      results['character_damages_given'] = results['character_hits'] * character.attack
      results['opponent_damages_given'] = results['opponent_hits'] * opponent.attack

      results
    end
end

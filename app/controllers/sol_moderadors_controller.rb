class SolModeradorsController < ApplicationController
  before_action :set_sol_moderador, only: [:show, :edit, :update, :destroy]

  # GET /sol_moderadors
  # GET /sol_moderadors.json
  def index
    @sol_moderadors = SolModerador.all
  end

  # GET /sol_moderadors/1
  # GET /sol_moderadors/1.json
  def show
  end

  # GET /sol_moderadors/new
  def new
    @sol_moderador = SolModerador.new
  end

  # GET /sol_moderadors/1/edit
  def edit
  end

  # POST /sol_moderadors
  # POST /sol_moderadors.json
  def create
    @sol_moderador = SolModerador.new(sol_moderador_params)

    respond_to do |format|
      if @sol_moderador.save
        format.html { redirect_to @sol_moderador, notice: 'Sol moderador was successfully created.' }
        format.json { render :show, status: :created, location: @sol_moderador }
      else
        format.html { render :new }
        format.json { render json: @sol_moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sol_moderadors/1
  # PATCH/PUT /sol_moderadors/1.json
  def update
    respond_to do |format|
      if @sol_moderador.update(sol_moderador_params)
        format.html { redirect_to @sol_moderador, notice: 'Sol moderador was successfully updated.' }
        format.json { render :show, status: :ok, location: @sol_moderador }
      else
        format.html { render :edit }
        format.json { render json: @sol_moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sol_moderadors/1
  # DELETE /sol_moderadors/1.json
  def destroy
    @sol_moderador.destroy
    respond_to do |format|
      format.html { redirect_to sol_moderadors_url, notice: 'Sol moderador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sol_moderador
      @sol_moderador = SolModerador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sol_moderador_params
      params.require(:sol_moderador).permit(:user_id)
    end
end

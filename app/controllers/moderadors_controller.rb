class ModeradorsController < ApplicationController
  before_action :set_moderador, only: [:show, :edit, :update, :destroy]

  # GET /moderadors
  # GET /moderadors.json
  def index
    @moderadors = Moderador.all
  end

  # GET /moderadors/1
  # GET /moderadors/1.json
  def show
  end

  # GET /moderadors/new
  def new
    @moderador = Moderador.new
  end

  # GET /moderadors/1/edit
  def edit
  end

  # POST /moderadors
  # POST /moderadors.json
  def create
    @moderador = Moderador.new(moderador_params)

    respond_to do |format|
      if @moderador.save
        format.html { redirect_to @moderador, notice: 'Moderador was successfully created.' }
        format.json { render :show, status: :created, location: @moderador }
      else
        format.html { render :new }
        format.json { render json: @moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moderadors/1
  # PATCH/PUT /moderadors/1.json
  def update
    respond_to do |format|
      if @moderador.update(moderador_params)
        format.html { redirect_to @moderador, notice: 'Moderador was successfully updated.' }
        format.json { render :show, status: :ok, location: @moderador }
      else
        format.html { render :edit }
        format.json { render json: @moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moderadors/1
  # DELETE /moderadors/1.json
  def destroy
    @moderador.destroy
    respond_to do |format|
      format.html { redirect_to moderadors_url, notice: 'Moderador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moderador
      @moderador = Moderador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moderador_params
      params.fetch(:moderador, {})
    end
end

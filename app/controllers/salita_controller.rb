class SalitaController < ApplicationController
  before_action :set_salitum, only: [:show, :edit, :update, :destroy]

  # GET /salita
  # GET /salita.json
  def index
    if params[:campu].blank?
      @rooms = Room.all
    else
      @campu_id = Campu.find_by(name: params[:campu]).id
      @rooms = Room.where(:campu_id => @campu_id)
    end
  end

  # GET /salita/1
  # GET /salita/1.json
  def show
  end

  # GET /salita/new
  def new
    @salitum = Salitum.new
  end

  # GET /salita/1/edit
  def edit
  end

  # POST /salita
  # POST /salita.json
  def create
    @salitum = Salitum.new(salitum_params)

    respond_to do |format|
      if @salitum.save
        format.html { redirect_to @salitum, notice: 'Salitum was successfully created.' }
        format.json { render :show, status: :created, location: @salitum }
      else
        format.html { render :new }
        format.json { render json: @salitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salita/1
  # PATCH/PUT /salita/1.json
  def update
    respond_to do |format|
      if @salitum.update(salitum_params)
        format.html { redirect_to @salitum, notice: 'Salitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @salitum }
      else
        format.html { render :edit }
        format.json { render json: @salitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salita/1
  # DELETE /salita/1.json
  def destroy
    @salitum.destroy
    respond_to do |format|
      format.html { redirect_to salita_url, notice: 'Salitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salitum
      @salitum = Salitum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salitum_params
      params.fetch(:salitum, {})
    end
end

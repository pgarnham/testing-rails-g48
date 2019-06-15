class EnchuvesController < ApplicationController
  before_action :set_enchufe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /enchuves
  # GET /enchuves.json
  def index
    @enchuves = Enchufe.all
  end

  # GET /enchuves/1
  # GET /enchuves/1.json
  def show
  end

  # GET /enchuves/new
  def new
    @enchufe = Enchufe.new
  end

  # GET /enchuves/1/edit
  def edit
  end

  # POST /enchuves
  # POST /enchuves.json
  def create
    @enchufe = Enchufe.new(enchufe_params)

    respond_to do |format|
      if @enchufe.save
        format.html { redirect_to @enchufe, notice: 'Enchufe was successfully created.' }
        format.json { render :show, status: :created, location: @enchufe }
      else
        format.html { render :new }
        format.json { render json: @enchufe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enchuves/1
  # PATCH/PUT /enchuves/1.json
  def update
    respond_to do |format|
      if @enchufe.update(enchufe_params)
        format.html { redirect_to @enchufe, notice: 'Enchufe was successfully updated.' }
        format.json { render :show, status: :ok, location: @enchufe }
      else
        format.html { render :edit }
        format.json { render json: @enchufe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enchuves/1
  # DELETE /enchuves/1.json
  def destroy
    @enchufe.destroy
    respond_to do |format|
      format.html { redirect_to enchuves_url, notice: 'Enchufe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @enchufe.upvote_from current_user
    @sala_uno = Room.find(@enchufe.room_id)
    @sala_uno.plugs = @enchufe.get_upvotes.size - @enchufe.get_downvotes.size
    @sala_uno.save
    redirect_to @sala_uno
  end

  def downvote
    @enchufe.downvote_from current_user
    @sala_uno = Room.find(@enchufe.room_id)
    @sala_uno.plugs = @enchufe.get_upvotes.size - @enchufe.get_downvotes.size
    @sala_uno.save
    redirect_to @sala_uno
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enchufe
      @enchufe = Enchufe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enchufe_params
      params.require(:enchufe).permit(:room_id)
    end
end

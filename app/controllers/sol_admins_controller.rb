class SolAdminsController < ApplicationController
  before_action :set_sol_admin, only: [:show, :edit, :update, :destroy]

  # GET /sol_admins
  # GET /sol_admins.json
  def index
    @sol_admins = SolAdmin.all
  end

  # GET /sol_admins/1
  # GET /sol_admins/1.json
  def show
  end

  # GET /sol_admins/new
  def new
    @sol_admin = SolAdmin.new
  end

  # GET /sol_admins/1/edit
  def edit
  end

  # POST /sol_admins
  # POST /sol_admins.json
  def create
    @sol_admin = SolAdmin.new(sol_admin_params)

    respond_to do |format|
      if @sol_admin.save
        format.html { redirect_to @sol_admin, notice: 'Sol admin was successfully created.' }
        format.json { render :show, status: :created, location: @sol_admin }
      else
        format.html { render :new }
        format.json { render json: @sol_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sol_admins/1
  # PATCH/PUT /sol_admins/1.json
  def update
    respond_to do |format|
      if @sol_admin.update(sol_admin_params)
        format.html { redirect_to @sol_admin, notice: 'Sol admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @sol_admin }
      else
        format.html { render :edit }
        format.json { render json: @sol_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sol_admins/1
  # DELETE /sol_admins/1.json
  def destroy
    @sol_admin.destroy
    respond_to do |format|
      format.html { redirect_to sol_admins_url, notice: 'Sol admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sol_admin
      @sol_admin = SolAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sol_admin_params
      params.require(:sol_admin).permit(:user_id)
    end
end

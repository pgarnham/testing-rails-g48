class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
    @id_recibido = params[:room_id]
  end

  # GET /groups/1/edit
  def edit
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.course_id = params[:course_id]

    respond_to do |format|
      if @group.save
        @primer_miembro = GroupMember.new
        @primer_miembro.user_id = @group.user_id
        @primer_miembro.group_id = @group.id
        @primer_miembro.save
        format.html { redirect_to eventos_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group.course_id = params[:course_id]
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to eventos_path, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to eventos_path, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:capacity, :start, :finish, :room_id, :user_id, :course_id)
    end
end

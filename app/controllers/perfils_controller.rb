class PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]

  # GET /perfils
  # GET /perfils.json
  def index
    @perfils = Perfil.all


    @soy_alumno = Alumno.where(:user_id => current_user.id)
    @id_cursos_donde_soy_alumno = []
    @soy_alumno.each do |alumno|
      @id_cursos_donde_soy_alumno << alumno.course_id
    end
    if @id_cursos_donde_soy_alumno.length == 0
      @cursos_totales_no_alumno = Course.all.map{ |c| [c.name, c.id] }
    else
      @cursos_donde_no_soy_alumno = Course.where('id NOT IN (?)', Array.wrap(@id_cursos_donde_soy_alumno))
      @cursos_totales_no_alumno = @cursos_donde_no_soy_alumno.map{ |c| [c.name, c.id] }
    end

    @alumno = Alumno.new
    @cursos_inscritos = Alumno.where(:user_id => current_user.id)



    @soy_profe = Profesor.where(:user_id => current_user.id)
    @id_cursos_donde_soy_profe = []
    @soy_profe.each do |profe|
      @id_cursos_donde_soy_profe << profe.course_id
    end
    if @id_cursos_donde_soy_profe.length == 0
      @cursos_totales_no_profe = Course.all.map{ |c| [c.name, c.id] }
    else
      @cursos_donde_no_soy_profe = Course.where('id NOT IN (?)', Array.wrap(@id_cursos_donde_soy_profe))
      @cursos_totales_no_profe = @cursos_donde_no_soy_profe.map{ |c| [c.name, c.id] }
    end

    @profesor = Profesor.new
    @profe_inscritos = Profesor.where(:user_id => current_user.id)



    @mis_publicaciones = Destacada.where(:user_id => current_user.id)


    @mis_eventos = []
    @ev_grupo = GroupMember.where(:user_id => current_user.id)
    @ev_grupo.each do |ev|
      @mis_eventos << Group.find(ev.group_id)
    end
    @ev_busco = RelacionBusco.where(:user_id => current_user.id)
    @ev_busco.each do |busco|
      @mis_eventos << Busco.find(busco.busco_id)
    end
    @mis_ofrezcos = Ofrezco.where(:user_id => current_user.id)
    @mis_ofrezcos.each do |of|
      @mis_eventos << of
    end
    @mis_ocupadas = Ocupada.where(:user_id => current_user.id)
    @mis_ocupadas.each do |oc|
      @mis_eventos << oc
    end
  end

  # GET /perfils/1
  # GET /perfils/1.json
  def show
  end

  # GET /perfils/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
  end

  # POST /perfils
  # POST /perfils.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to @perfil, notice: 'Perfil was successfully created.' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1
  # PATCH/PUT /perfils/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to @perfil, notice: 'Perfil was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1
  # DELETE /perfils/1.json
  def destroy
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfils_url, notice: 'Perfil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.fetch(:perfil, {})
    end
end

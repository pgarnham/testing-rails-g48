class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @publicaciones = []
    if params[:course].blank?
      @publicaciones = Post.all
    else
      if params[:course] == "Mis Cursos"
        @mis_cursos_act = []
        Alumno.all.each do |alu|
          if alu.user_id == current_user.id
            @mis_cursos_act << Course.find(alu.course_id)
          end
        end
        Profesor.all.each do |profe|
          if profe.user_id == current_user.id
            @mis_cursos_act << Course.find(profe.course_id)
          end
        end
        @mis_cursos_act.each do |curs|
          @actuales = Post.where(course_id: curs.id)
          @actuales.each do |act|
            @publicaciones << act
          end
        end
      else
        @curso_id = Course.find_by(name: params[:course]).id
        @publicaciones = Post.where(course_id: @curso_id)
      end
    end

    @para_elegir = []
    Course.all.each do |cursito|
      @para_elegir << cursito
    end
    @aux = Auxiliar.find_by(name: "Mis Cursos")
    @para_elegir << @aux
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @nuevo_comentario = Comment.new
  end

  # GET /posts/new
  def new
    #@post = Post.new
    @post = current_user.posts.build
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
  end

  # GET /posts/1/edit
  def edit
    @cursitos = Course.all.map{ |c| [c.name, c.id]}
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @post.course_id = params[:course_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.course_id = params[:course_id]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_from current_user
    redirect_to @post
  end

  def downvote
    @post.downvote_from current_user
    redirect_to @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :created_at, :description, :reputation, :author, :image, :course_id)
    end
end

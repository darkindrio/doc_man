class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy, :categories]

  # GET /documents
  # GET /documents.json
  def index
    if !params[:search].nil?
      @documents = Document.where("title like ?", "%#{params[:search]}%").order('title ASC')
    else
      @documents = current_user.collab_documents.order('title ASC') + Document.where("is_public == 't'")
    end
  end

  # GET /documents
  # GET /documents.json
  def my_documents_index
      @documents = current_user.collab_documents.order('title ASC')
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown_text = markdown.render(@document.text)
    @document.text = markdown_text
  end

  # GET /documents/new
  def new
    @document = Document.new
    @document.categories = [Category.new]
    puts current_user
    @current_user = current_user
  end

  # GET /documents/1/edit
  def edit
  end

  def categories
  end


  def markdownHtml
    text_to_markDown = params[:rc_text]
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markwond_text = markdown.render(text_to_markDown)
    jsonObject = {"text" => markwond_text}
    respond_to do |format|
      format.html
      format.json { render json: jsonObject }
    end
  end


  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[document_params])
    @document.categories << Category.find(params[:document][:categories].drop(1))
    @document.users << User.find(params[:document][:users].drop(1))
    @document.title = params[:document][:title]
    @document.text = params[:document][:text]
    @document.user = current_user
    if params[:document][:is_public] == 'true'
      @document.is_public = true
      puts "us public"
    else
      @document.is_public = false
    end
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    if not Category.find(params[:document][:categories].drop(1)).blank?
      @document.categories = []
      @document.categories << Category.find(params[:document][:categories].drop(1))
    end
    params[:document][:categories] << Category.find(params[:document][:categories].drop(1))

    if not User.find(params[:document][:users].drop(1)).blank?
      @document.users = []
      @document.users << User.find(params[:document][:users].drop(1))
    end
    params[:document][:users] << User.find(params[:document][:users].drop(1))

    if params[:document][:is_public] == 'true'
      @document.is_public = true
    else
      @document.is_public = false
    end

    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params[:document].permit(:title, :is_public, :text, :categories => [], :users => [])
    end
end

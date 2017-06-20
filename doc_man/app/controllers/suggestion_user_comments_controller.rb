class SuggestionUserCommentsController < ApplicationController
  before_action :set_suggestion_user_comment, only: [:show, :edit, :update, :destroy]

  # GET /suggestion_user_comments
  # GET /suggestion_user_comments.json
  def index
    @suggestion_user_comments = SuggestionUserComment.all
    document_id = params[:document_id]
    @document = Document.find(document_id)
  end

  # GET /suggestion_user_comments/1
  # GET /suggestion_user_comments/1.json
  def show
  end

  # GET /suggestion_user_comments/new
  def new
    @suggestion_user_comment = SuggestionUserComment.new
    
  end

  # GET /suggestion_user_comments/1/edit
  def edit
    @document = Document.find(params[:document_id])
    @suggestion = Suggestion.find(params[:suggestion_id])
    comment = SuggestionUserComment.find(params[:id])
    comment_creator = comment.user
    if comment_creator != current_user
      redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), alert: 'Unable to edit this document.'
    end
  end

  # POST /suggestion_user_comments
  # POST /suggestion_user_comments.json
  def create
    @suggestion_user_comment = SuggestionUserComment.new(suggestion_user_comment_params)
    respond_to do |format|
      if @suggestion_user_comment.save
        format.html { redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), notice: 'Suggestion user comment was successfully created.' }
        format.json { render :show, status: :created, location: @suggestion_user_comment }
      else
        format.html { render :new }
        format.json { render json: @suggestion_user_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestion_user_comments/1
  # PATCH/PUT /suggestion_user_comments/1.json
  def update
    puts "user params"
    puts suggestion_user_comment_params[:comment]
    respond_to do |format|
      if @suggestion_user_comment.update(suggestion_user_comment_params)
        format.html { redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), notice: 'Suggestion user comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion_user_comment }
      else
        format.html { redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), alert: 'Error to edit this document.' }
        format.json { render json: document_suggestion_path(params[:document_id],id: params[:suggestion_id]), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestion_user_comments/1
  # DELETE /suggestion_user_comments/1.json
  def destroy
    comment = SuggestionUserComment.find(params[:id])
    comment_creator = comment.user
    if comment_creator == current_user
      @suggestion_user_comment.destroy
      respond_to do |format|
        format.html { redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), notice: 'Suggestion user comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to document_suggestion_path(params[:document_id],id: params[:suggestion_id]), alert: 'Unable to destroy this document.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion_user_comment
      @suggestion_user_comment = SuggestionUserComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_user_comment_params
      params.require(:suggestion_user_comment).permit(:user_id, :suggestion_id, :comment)
    end
end

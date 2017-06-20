class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    document_id = params[:document_id]
    @document = Document.find(document_id)
    @suggestions = @document.suggestions
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    @suggestion_user_comment = SuggestionUserComment.new
    document_id = params[:document_id]
    @document = Document.find(document_id)
    @suggestions = Suggestion.find(params[:id])
    @comments = @suggestions.suggestion_user_comments
    
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
    @document = Document.find(params[:document_id])
  end

  # GET /suggestions/1/edit
  def edit
    document_id = params[:document_id]
    @document = Document.find(document_id)
    collaborators = @document.users
    if not collaborators.include? current_user
      redirect_to document_suggestions_url, alert: 'Unable to edit this document.'
    end
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to document_suggestion_url(params[:suggestion][:document_id],@suggestion), notice: 'Suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to document_suggestions_url, notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    document_id = params[:document_id]
    document = Document.find(document_id)
    collaborators = document.users
    if collaborators.include? current_user
      @suggestion.destroy
      respond_to do |format|
        format.html { redirect_to document_suggestions_url, notice: 'Suggestion was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to document_suggestions_url, alert: 'Unable to destroy this document.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:document_id, :user_id, :text, :status)
    end
end

class FanCommentsController < ApplicationController
  before_action :set_fan_comment, only: [:show, :edit, :update, :destroy]

  # GET /fan_comments
  # GET /fan_comments.json
  def index
    @fan_comments = FanComment.all
  end

  # GET /fan_comments/1
  # GET /fan_comments/1.json
  def show
  end

  # GET /fan_comments/new
  def new
    @fan_comment = FanComment.new
  end

  # GET /fan_comments/1/edit
  def edit
  end

  # POST /fan_comments
  # POST /fan_comments.json
  def create
    @fan_comment = FanComment.new(fan_comment_params)

    respond_to do |format|
      if @fan_comment.save
        format.html { redirect_to @fan_comment, notice: 'Fan comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fan_comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @fan_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fan_comments/1
  # PATCH/PUT /fan_comments/1.json
  def update
    respond_to do |format|
      if @fan_comment.update(fan_comment_params)
        format.html { redirect_to @fan_comment, notice: 'Fan comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fan_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fan_comments/1
  # DELETE /fan_comments/1.json
  def destroy
    @fan_comment.destroy
    respond_to do |format|
      format.html { redirect_to fan_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fan_comment
      @fan_comment = FanComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fan_comment_params
      params.require(:fan_comment).permit(:author_no, :name, :body, :deleted)
    end
end

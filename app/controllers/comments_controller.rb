class CommentsController < ApplicationController
  skip_before_action :authorize, only: [:create] # allow not signed user to add comments
  before_action :current_user, only: [:create] # set current user without auth error for create action

  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :check_comment_owner, only: [:show, :update, :destroy]

  # GET /comments
  def index
    # get user comments
    @comments = Comment.where(user_id: @user.id)

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params_for_update)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text, :ad_id)
    # add auth user id in params (user is optional for :create so we use '&.')
          .merge(user_id: @user&.id)
  end

  def comment_params_for_update
    # disable to update ad for comment
    comment_params.except(:ad_id)
  end

  def check_comment_owner
    # TODO Add admin rights for ad: (|| user.is_admin)
    if @user&.id != @comment.user_id
      render json: { error: "You aren't owner of this comment" }, status: :forbidden
    end
  end
end

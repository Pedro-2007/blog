class CommentsController < ApplicationController
 before_action :set_post
 before_action :set_comments, only: %i[ show edit update destroy ]

  # comment /comments or /comments.json
  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render "posts/show"}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
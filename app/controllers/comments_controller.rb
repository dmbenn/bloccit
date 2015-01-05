class CommentsController < ApplicationController

  respond_to :html, :js

  def create 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @topic = @post.topic
  
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      redirect_to topic_post_path(@topic, @post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @topic = @post.topic

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
    else
      flash[:error] = "Comment could not be deleted"
    end

    respond_with(@comment) do |format|
      format.html {redirect_to [@post.topic, @post]}
    end
  end


  private 

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

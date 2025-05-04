class Posts::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @post.post_comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Комментарий добавлен.'
    else
      redirect_to post_path(@post), alert: 'Комментарий не может быть пустым.'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Комментарий обновлён.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: 'Комментарий удалён.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.post_comments.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:body)
  end
end

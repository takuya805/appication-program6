class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(params_comment)
    @comment.book_id = @book.id
    @comment.save
    @comments = @book.comments
  end

  def destroy
  @book = Book.find(params[:book_id])
  @comments = @book.comments
  @comment = Comment.find_by(id: params[:id], book_id: params[:book_id])
  @comment.destroy
  end

  private
  def params_comment
    params.require(:comment).permit(:comment)
  end
end

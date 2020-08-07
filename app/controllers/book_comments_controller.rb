class BookCommentsController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        book = Book.find(params[:book_id])
        @user = User.find(book.user_id)
        @comment = BookComment.new
        comment =current_user._book_comments.new(book_comment_params)
        comment.book_id = book.id
        if comment.save
            #redirect_to book_path(book)
        else
            flash[:comment] = "commented error"
            #redirect_to book_path(book)
        end
    end

    def destroy
        @book = Book.find(params[:book_id])
        @comment = BookComment.new
        comment = BookComment.find(params[:id])
        comment.destroy
        #redirect_back(fallback_location: root_path)
    end

    private

    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end

end

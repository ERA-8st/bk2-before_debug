class SearchController < ApplicationController

    def search
        @user_or_post = params[:option]
        @type = params[:type]
        if @user_or_post == "1"
          if @type == "1"
            @users = User.where(name: "#{params[:search]}")
          elsif @type == "2"
            @users = User.where("name LIKE?", "#{params[:search]}%")
          elsif @type == "3"
            @users = User.where("name LIKE?", "%#{params[:search]}")
          elsif @type == "4"
            @users = User.where("name LIKE?", "%#{params[:search]}%")
          else
            @users = User.all
          end
        else
            if @type == "1"
                @books = Book.where(title: "#{params[:search]}")
              elsif @type == "2"
                @books = Book.where("title LIKE?", "#{params[:search]}%")
              elsif @type == "3"
                @books = Book.where("title LIKE?", "%#{params[:search]}")
              elsif @type == "4"
                @books = Book.where("title LIKE?", "%#{params[:search]}%")
              else
                @books = Book.all
              end
        end
    end
    

end

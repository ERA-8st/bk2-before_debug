class RelationshipsController < ApplicationController

    def create
        @user =User.find(params[:relationship][:following_id])
        current_user.follow(@user)
        redirect_back(fallback_location: root_url)
        #未非同期
        respond_to do |format|
            format.html {redirect_back(fallback_location: root_url)}
            format.js
        end
        end

        def destroy
        @user = User.find(params[:relationship][:following_id])
        current_user.unfollow(@user)
        #未非同期
        redirect_back(fallback_location: root_url)
        respond_to do |format|
            format.html {redirect_back(fallback_location: root_url)}
            format.js
        end
    end

end

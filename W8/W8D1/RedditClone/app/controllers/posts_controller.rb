class PostsController < ApplicationController

    before_action :require_logged_in

    def new
        @sub = Sub.find_by(id: params[:post][:sub_id])
        @author = User.find_by(id: params[:post][:author_id])
        render :new 
    end

    def show 
        @post = Post.find_by(id: params[:id])
        render :show 
    end

    def create  
        @post = Post.new(post_params)
        @post.author_id = current_user.id 
        # @post.url = post_path(@post)
        if @post.save 
            redirect_to sub_path(params[:post][:sub_id])
        else   
            flash.now[:errors] = @post.errors.full_messages
            render :new 
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit 
    end

    def update 
        @post = Post.find_by(id: params[:id])
        if current_user == @post.author
            if @post.update(post_params)
                redirect_to post_url(@post)
            else  
                flash.now[:errors] 
                render :edit 
            end
        else   
            flash[:errors] = ['you dont have permission to do this']
            redirect_to post_url(@post)
        end 
    end

    def current_sub
        @current_sub ||= Sub.find_by(id: params[:id])
    end

    def destroy 
        @post = Post.find_by(id: params[:id])
        if current_user == @post.author || @current_sub.moderator_id == current_user.id
            @post.destroy 
            redirect_to sub_url(@current_sub)
        else   
            flash[:errors] = ['you cant do that']
            redirect_to sub_url(@current_sub)
        end
    end

    private 
    def post_params 
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end
end

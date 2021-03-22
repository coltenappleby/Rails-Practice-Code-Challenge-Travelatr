class PostsController < ApplicationController

    def show 
        @post = Post.find(params[:id])
    end 

    def update_like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params(:title, :content, :blogger_id, :destination_id))
        if @post.valid?
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params(:title, :content))
        if @post.valid?
            redirect_to post_path(@post)
        else
            redirect_to edit_post_path(@post)
        end

    end


    private

    def post_params(*args)
        params.require(:post).permit(*args)
    end

end
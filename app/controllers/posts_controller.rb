class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find_by(id: params[:id])
        render json: post
    end

    def update
        post = Post.find_by(id: params[:id])
        post.update!(post_params)
        render json: post
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    private

    def post_params
        params.permit(:category, :content, :title)
    end
    
end

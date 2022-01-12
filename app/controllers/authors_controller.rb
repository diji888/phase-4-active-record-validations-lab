class AuthorsController < ApplicationController

    def index
        authors = Author.all
        render json: authors
    end

    def show
        author = Author.find_by(id: params[:id])
        render json: author
    end

    def create
        author = Author.create(author_params)
        if author
            render json: author, status: :created
        else 
            render json: { error: "is not valid" }, status: :unprocessable_entity
        end       
    end
end

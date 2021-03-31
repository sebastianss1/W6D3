class UsersController < ApplicationController
    def index
        users = User.all 
        render json: users
    end

    def create
        render json: params
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else 
             render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 



    def update
        user = User.find(params[:id])      
        if user.update(params.require(:user).permit(:name, :email))
            render json: user
        else 
             render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 


    def destroy
        user = User.find(params[:id])

        if user.destroy
            render json: user
        else 
            render json: "can't destroy this user"
        end 

    end 
end
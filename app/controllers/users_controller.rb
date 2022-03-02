class UsersController < ApplicationController
    # load_and_authorize_resource
    
    def index
        @users = User.all
        render json: @users
    end

    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.valid_password?(params[:password])
            @payload = {user_id: @user.id}
            @token = encode(@payload)
            render :json => {token: @token}
        else
            render json: {error: "User not found"}
        end
    end

    def token_authenticate
        @token = request.headers["Authenticate"]
        @user = User.find(decode(@token)["user_id"])

        render json: @user 
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def new
        @user = User.new
    end

     def create
        @user = User.new(user_params)
    
        if @user.save
            render json: @user, status: :created
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
        render json: @user
    end
    
    def update
        @user = User.find(params[:id])
    
        if @user.update(user_params)
            render json: @user
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        
        if @user.present?
            render json: @user
            @user.destroy 
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end


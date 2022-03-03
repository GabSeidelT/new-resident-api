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
            @token = encode_token(@payload)
            render :json => {token: @token}
        else
            render json: {error: "User not found"}
        end
    end

    def token_authenticate
        @token = request.headers["Authenticate"]
        @user = User.find(decode_token(@token)["user_id"])

        render json: @user 
    end 

    def create
      user = User.create(user_params)
      if user.valid?
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token}
      else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
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
        params.require(:user).permit(:email, :password, :resident_id)
    end

end


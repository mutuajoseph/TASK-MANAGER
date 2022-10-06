class UsersController < ApplicationController

    # GET /users
    def index
        render json: User.all, status: :ok  #200
    end

    # GET /users/{id}
    def show
        user = User.find_by(id:params[:id])
        if user
            render json: user, status: :ok
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # POST /users
    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else 
            render json: { errors: user.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    # PUT/PATCH /users/{id}
    def update
        user = User.find_by(id:params[:id])

        if user
            user.update(user_params)
            render json: user, status: :accepted
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # DELETE /users/{id}
    def destroy
        user = User.find_by(id:params[:id])

        if user
            user.destroy
            head :no_content
        else
            render json: { error: "User not found"}, status: :not_found
        end
    end

    # AUTHENTICATE USER
    def login
        user = User.find_by(email:params[:email])

        # validate that the user exists
        if user && user.authenticate(params[:password])
            token = encode_token({id: user.id})
            render json: { user: user, token: token }, status: :ok
        else
            render json: { error: 'Invalid email or password'}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(
            :first_name, :last_name, :email, :username, :password, :password_confirmation
        )
    end
end

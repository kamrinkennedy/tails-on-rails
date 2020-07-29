class SessionsController < ApplicationController
    
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path, alert: "Invalid credentials. Please try again."
        end
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path, alert: user.errors.full_messages.join(", ")
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end

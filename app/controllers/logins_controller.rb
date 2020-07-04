class LoginsController < ApplicationController

    skip_before_action :require_user, only: [:new, :create]

    def new
    
    end

    def create
        student = Student.find_by(email: params[:logins][:email].downcase)
        if  student && student.authenticate(params[:logins][:password])
            session[:student_id] = student.id
            flash[:notice] = "You have logged in successfully"
            redirect_to student
        else
            flash.now[:notice] = "Something was wrong with your login information"
            render 'new'
        end
    end

    def detroy
        session[:student_id] = nil
        flash[:notice] = "You have logged out successfully"
        redirect_to root_path
    end

end
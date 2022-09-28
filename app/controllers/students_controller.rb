class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Student.all
    end

    def create
        student = Student.create!(params_permit)
        render json: student, status: :created
    end

    def update 
        student = find_student
        student.update!(params_permit)
        render json: student, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    private 

    def find_student
        Student.find(params[:id])
    end

    def params_permit
        params.permit(:name, :major, :age, :instructor_id)
    end

    def not_found
        render json: { "error": "Student not found" }, status: :not_found
    end
end

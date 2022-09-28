class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Instructor.all, status: :ok
    end

    def create 
        instructor = Instructor.create!(params_permit)
        render json: instructor, status: :created
    end

    def update 
        instructor = find_instructor
        instructor.update!(params_permit)
        render json: instructor, status: :ok
    end

    def destroy 
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end

    private 

    def find_instructor
        Instructor.find(params[:id])
    end

    def params_permit
        params.permit(:name)
    end

    def not_found
        render json: { error: "Instructor not found" }, status: :not_found
    end

end

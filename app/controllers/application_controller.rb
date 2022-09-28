class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    private
    
    def invalid(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end

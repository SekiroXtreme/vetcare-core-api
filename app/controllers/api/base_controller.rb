module Api
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def resource_response(resource, serializer:, status: :ok)
      render json: serializer.render(resource), status: status
    end

    def no_content_response
      head :no_content
    end

    private

    def not_found_response(exception)
      render json: { error: "#{exception.model} no encontrado" }, status: :not_found
    end

    def unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
  end
end

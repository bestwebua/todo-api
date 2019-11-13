# frozen_string_literal: true

module Response
  def json_response(object, status = :ok)
    object = object.is_a?(Hash) ? object : serializer.new(object).serialized_json
    render json: object, status: status
  end
end

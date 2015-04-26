module RhizomeBuilder
  class Errors
    def bad_request
      [400, {'Content-Type' => 'text/html'}, ["Bad Request"]]
    end

    def not_authorized(type = 'text/html')
      [403, {'Content-Type' => type}, ["Not Authorized"]]
    end
  end
end

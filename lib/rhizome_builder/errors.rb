module RhizomeBuilder
  class Errors
    def bad_request
      [400, {'Content-Type' => 'text/html'}, ["Bad Request"]]
    end
  end
end

require_relative './auth'

module RhizomeBuilder
  class Actions
    extend Auth
    #puts Auth.authorize!

    class << self
      def get(request)
        authorize!
        [200, {'Content-Type' => 'text/html'}, ["Carlos: #{request.inspect}"]]
      end

      def post(request)
        authorize!
        [200, {'Content-Type' => 'text/html'}, ["Carlos Post"]]
      end
    end
  end
end

require_relative "./actions"
require_relative "./errors"

module RhizomeBuilder
  def self.call(env)
    puts env.inspect
    @request = Rack::Request.new env
    method_sym = @request.env["REQUEST_METHOD"].downcase.to_sym

    if Actions.respond_to? method_sym
      method_obj = Actions.method method_sym
      @response = method_obj.call(@request)
      return @response
    else
      return Errors.new.bad_request
    end
  end

  private

end

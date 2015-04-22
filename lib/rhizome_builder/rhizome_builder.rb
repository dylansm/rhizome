module RhizomeBuilder

  def self.call(env)
    @request = Rack::Request.new env
    #method = @request.env["REQUEST_METHOD"].downcase.to_sym
    #if self.methods.include? method
      #@response = self.send(method)
    #else
    #end
    method = self.method @request.env["REQUEST_METHOD"].downcase.to_sym
    @response = method.call

    [200, {'Content-Type' => 'text/html'}, [@response]]
  end

  def self.post
    "In post method #{@request.env['REQUEST_METHOD']}"
  end

  def self.get
    "In get method #{@request.env['REQUEST_METHOD']}"
  end



end

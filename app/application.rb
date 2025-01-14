class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            request = req.path.split("/items/").last
            item = Item.all.find{|i| i.name == request}
            if item == nil
                resp.write "Item not found"
                resp.status = 400
            else resp.write item.price
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end
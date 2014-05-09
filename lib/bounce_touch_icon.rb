require "bounce_touch_icon/version"

module BounceTouchIcon
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if touch_icon_path? env["PATH_INFO"]
        [404, {"Content-Type" => "text/html", "Content-Length" => "0"}, []]
      else
        @app.call(env)
      end
    end

    private

    def touch_icon_path?(path)
      !! path.to_s.match(%r{\A/apple-touch-icon(-\d+x\d+)?(-precomposed)?\.png})
    end
  end
end

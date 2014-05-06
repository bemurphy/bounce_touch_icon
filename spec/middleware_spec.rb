require "minitest/spec"
require "minitest/autorun"
require "rack/test"
require "bounce_touch_icon"

describe BounceTouchIcon::Middleware do
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      use BounceTouchIcon::Middleware
      run lambda { |env| [200, {
        'Content-Type'   => "text/plain",
        'Content-Length' => "2"
      }, ["OK"]] }
    end
  end

  it "passes through a non-matching request" do
    get "/"
    assert_equal "OK", last_response.body
    assert_equal 200, last_response.status
  end

  it "404s an /apple-touch-icon.png icon request" do
    get "/apple-touch-icon.png"
    assert_equal 404, last_response.status
  end

  it "404s an /apple-touch-icon-X-Y.png icon request featuring dimensions" do
    get "/apple-touch-icon-120x120.png"
    assert_equal 404, last_response.status

    get "/apple-touch-icon-72x72.png"
    assert_equal 404, last_response.status
  end

  it "404s an /apple-touch-icon-precomposed.png icon request" do
    get "/apple-touch-icon-precomposed.png"
    assert_equal 404, last_response.status
  end

  it "404s an /apple-touch-icon-XxY-precomposed.png icon request" do
    get "/apple-touch-icon-120x120-precomposed.png"
    assert_equal 404, last_response.status

    get "/apple-touch-icon-72x72-precomposed.png"
    assert_equal 404, last_response.status
  end
end

require 'rails_helper'

RSpec.describe "Cocktails", type: :request do
  describe "GET /cocktails " do
    it "should respond with 200 ok" do
      get '/cocktails'
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'
require 'json'

RSpec.describe "Cocktails", type: :request do
  describe "GET /cocktails " do

    before(:each) do
      get '/cocktails'
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should render json" do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it "should render an array with 3 cocktails" do
      cocktails = JSON.parse(response.body)
      expect(cocktails.length).to eq(3)
    end

  end
  
  describe "GET /cocktails/:id" do

    it "should respond with json when given valid id" do
      get '/cocktails/1'
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it "should return Espresso Martini when going to id 1" do
      get '/cocktails/1'
      expect(response.body).to include("Espresso Martini")
    end

    it "should respond with 404 when given invalid id" do
      get '/cocktails/99'
      expect(response).to have_http_status(404)
      expect(response.body).to include("Could not find cocktail")
    end

  end

end

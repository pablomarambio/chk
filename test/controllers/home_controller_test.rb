require "test_helper"

describe HomeController do
  describe "index" do
    it "should display the upcoming events" do
      get :index
      response.body.must_match /Über/
    end
  end
end

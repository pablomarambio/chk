require "test_helper"

describe HomeController do
  describe "index" do
    it "should display the upcoming events" do
      get :index
      response.body.must_match /Über Event 1/
      response.body.must_match /Super Event 2/
    end
  end
end

require "test_helper"

describe EventsController do
  describe "apply" do
    it "shouldn't allow applying to non-existing events" do
      get :apply, :id => events(:future2).id + 1
      response.code.must_equal "404"
    end
    it "shouldn't allow applying to past events" do
      get :apply, :id => events(:past).id
      response.code.must_equal "404"
    end
    it "should allow applying to future events" do
      get :apply, :id => events(:future2).id
      response.code.must_equal "302"
    end
  end
end

require "test_helper"

describe Event do
  describe "basic" do
    describe "attributes" do
      it "should have a date" do
        Event.new.respond_to?(:when).must_equal true
      end
      it "should have a name" do
        Event.new.respond_to?(:name).must_equal true
      end
      it "should have a description" do
        Event.new.respond_to?(:description).must_equal true
      end
      it "should have a picture" do
        Event.new.respond_to?(:picture).must_equal true
      end
      it "should have an address" do
        Event.new.respond_to?(:address).must_equal true
      end
      it "should have a city" do
        Event.new.respond_to?(:when).must_equal true
      end
      it "should have a country" do
        Event.new.respond_to?(:when).must_equal true
      end
      it "should have a duration" do
        Event.new.respond_to?(:when).must_equal true
      end
      it "should have a price" do
        Event.new.respond_to?(:price).must_equal true
      end
    end
    it "should allow saving" do
      new_event = Event.new.tap do |e|
        e.when = Time.now + 2.days
        e.name = "Clase de cocina"
        e.description = "Clase de cocina con el conocido chef Mr. Dogs"
        e.address = "Consejo de Indias 1361, D 304"
        e.city = "Santiago"
        e.country = "Chile"
        e.picture = "Diana Bolocco.jpg"
        e.price = 9.95
        e.duration = 120 # in minutes
      end
      new_event.save!
    end
  end
  describe "searching" do
    describe "upcoming events" do
      before do
        @events = Event.upcoming_for("Santiago")
        @events.wont_be_empty
      end
      it "should only display events in the future" do
        @events.each { |e| e.when.must_be :>, Time.now.beginning_of_day }
      end
      it "should only display events for the current city" do
        @events.each { |e| e.city.must_equal "Santiago" }
      end
    end
  end
end

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
        e.duration = 120 # in minutes
      end
      new_event.save!
    end
  end
end

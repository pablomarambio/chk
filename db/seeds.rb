Event.destroy_all
event = Event.new.tap do |e|
  e.when = "2013-12-18 14:13:51"
  e.duration = 1
  e.address = "Barrio Central"
  e.city = "Santiago"
  e.country = "Chile"
  e.name = "Über party"
  e.price = 9.95
  e.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five."
  e.picture = "http://cakeknifephotography.com/blog/wp-content/uploads/2013/05/wedding-aspen-denver-colorado-black-white-photography-photographer-sundeck-portrait-marriage-husband-wife-unique-beautiful-light-lit-professional-love-happy-mountain-joking-clocktower-candid-group-wine-party-drunk-friends-fun.jpg"
end
event.save!
event = Event.new.tap do |e|
  e.when = "2014-01-18 14:13:51"
  e.duration = 1
  e.address = "Las Colinas 1313"
  e.city = "Santiago"
  e.country = "Chile"
  e.name = "Ultra doggy party"
  e.price = 19.95
  e.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five."
  e.picture = "http://cakeknifephotography.com/blog/wp-content/uploads/2013/05/wedding-aspen-denver-colorado-black-white-photography-photographer-sundeck-portrait-marriage-husband-wife-unique-beautiful-light-lit-professional-love-happy-mountain-joking-clocktower-candid-group-wine-party-drunk-friends-fun.jpg"
end
event.save!

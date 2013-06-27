require 'opengraph'

namespace :styleseat do
  desc "This populates Kat's current info from Style Seat"
  task populate: :environment do
    og = OpenGraph.fetch("https://www.styleseat.com/katpark")
    ss = StyleSeat.new
    ss.title = og.title
    ss.street_address = og.street_address
    ss.city = og.locality
    ss.state = og.region
    ss.zip_code = og.postal_code
    ss.phone_number = og.phone_number
    ss.image = og.image
    ss.save
  end

  desc "This updates Kat's current info from Style Seat"
  task update: :environment do
    og = OpenGraph.fetch("https://www.styleseat.com/katpark")
    ss = StyleSeat.find(1)
    ss.title = og.title
    ss.street_address = og.street_address
    ss.city = og.locality
    ss.state = og.region
    ss.zip_code = og.postal_code
    ss.phone_number = og.phone_number
    ss.image = og.image
    ss.save
  end
end

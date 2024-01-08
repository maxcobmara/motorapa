# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "setting up manufacturing facilities"

manufacturers = ["Adiva", "AJS", "Aprilia", "Aveta", "Benelli", "Bimota", "BKZ", "Blueshark", "BMW", "Brixton", "Buell", "Can-Am", "CFMoto", "Comel", "CMC", "Daelim", "Daiichi", "Demak", "Ducati", "Fantic", "Gilera", "GPX", "Harley-Davidson", "Honda", "Husaberg", "Husqvarna", "Hyosung", "Indian", "Italjet", "Jawa", "Kawasaki", "Kayo", "Keeway", "KTM", "KTNS", "Kymco", "Lambretta", "Laverda", "LIMA", "MLE", "Modenas", "Momos", "Moto Guzzi", "Moto Morini", "MV Agusta", "Mz", "Naza", "Nimota", "Nitro", "Norton", "Ottimo", "Petronas", "Piaggio", "Royal Alloy", "Royal Enfield", "QJ Motor", "Scomadi", "Sherco", "Skyteam", "SM Sport", "Steyr Daimler", "Suzuki", "SYM", "Treeletrik", "Triumph", "TVS", "Vespa", "Victory", "WMOTO", "X-MOTO", "Yamaha", "Yadea", "Zero Engineering", "Zesparii", "Zontes"]

manufacturers.each do | m |
  Manufacturer.find_or_create_by!(name: m)
end

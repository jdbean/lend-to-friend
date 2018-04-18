# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all
Loan.destroy_all

clothing_photos = %w{https://www.thedropdate.com/wp-content/uploads/2018/04/FEAT-IMAGE-9-300x300.png
http://content.asos-media.com/-/media/images/articles/women/2018/04/12/free-people-hot-10/free-people-hot-10-300x300-cta-01.jpg?h=300&w=300&hash=092AF9C085F8CC4BDD2AF0176FBBA36F9CF1C9C4
https://i4cache.dealmoon.com/thumbimg.dealmoon.com/dealmoon/fc1/dfd/699/8a0ea2c057057b81f3592de.jpg_300_0_13_55ff.jpg
http://content.asos-media.com/-/media/images/articles/women/2018/01/02/ew-300x300-cta.jpg?h=300&w=300&hash=67E8EB553F4905B124FA8008C94E371EBEDFECB2
http://www.fabulicious.co.in/image/cache/catalog/Fabulicious/Exclusive%20Dresses/Hot%20woman%20club%20wear%20floral%20designer%20cut%20work%20sexy%20dress-300x300.jpg
https://rhalyns-canugo5czzvy84juz.netdna-ssl.com/wp-content/uploads/2018/01/YUETONGME-2017-new-Couture-Black-and-white-striped-long-sleeved-T-shirt-women-slim-fit-raglan-1-300x300.jpg}

movie_photos = %w{https://upload.wikimedia.org/wikipedia/commons/f/f7/Film_zone.png
https://upload.wikimedia.org/wikipedia/commons/d/d9/Wikibooks-logo_%28negative_film%29.png
https://upload.wikimedia.org/wikipedia/commons/a/a5/Fox_movies.png
https://upload.wikimedia.org/wikipedia/commons/3/3f/Theatre_white.png
https://upload.wikimedia.org/wikipedia/commons/c/c3/Films_United_Official_Company_logo.png}


household_photos = ["http://wac.edgecastcdn.net/001A39/prod/item/m3MnATt2Q8Tu53esite/2767L.png",
"https://www.powertoolsandwoodworking.com/wp-content/uploads/2011/01/DeWalt-DC720KA-18v-Cordless-Drill-300x300.jpg",
"https://thegrillinglife.com/wp-content/uploads/2017/04/Best-Luxury-Gas-Grills-Napoleon-Grills-Prestige-PRO-665-Liquid-Propane-Gas-Grill-300x300.jpg",
"http://csusga.com/s/2018/02/best-ideas-oneida-silverware-and-flatware-giraffa-etching-5-piece-place-setting-ideas-wonderful-oneida-silverware-for-dining-ideas-oneida-silverware-company-oneida-silverware-300x300.jpg",
"https://d3v4i80726wzko.cloudfront.net/wp-content/uploads/20140604142357/TTU-U1932-EC-Set-of-Six-8-Inch-Stoneware-Salad-Plates-by-Tabletops-Gallery-300x300.jpg"]

game_photos = %w{http://static1.squarespace.com/static/57b74d05d1758ee9c0fea868/57bb16633e00beec5114d6ad/58c6c793579fb32813b70bf6/1489509833018/zelda-main.jpg?format=1000w
http://ps3gamerzone.com/wp-content/uploads/2012/04/MPPic1-300x300.jpg
http://bookmans.com/wp-content/uploads/2017/04/Melee.png
https://images-na.ssl-images-amazon.com/images/I/41R9FArsBDL._SY300_QL70_.jpg
http://www.iheartamiibo.com/wp-content/uploads/2015/04/Kirby-and-the-Rainbow-Curse-Game-300x300.jpg}

book_photos = %w{http://commonsladiesclub.com/wp-content/uploads/2014/12/Books-300w.jpg
https://bostonbookfest.org/wp-content/uploads/2016/03/Store_product_2012poster_300x300.jpg
http://www.pikidsmedia.com/sites/default/files/styles/square/public/images/titles/00155000_0.jpg?itok=KNNC5-8i
http://thekwakbrothers.com/wp-content/uploads/2016/04/book-dribbb-300x300.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_IPejACIr_czav9Pzr1AShG3iLnQ0QWj7Vb9FMb6xKOhT-i_4
http://www.nandastationers.com/wp-content/uploads/2016/06/Senior-Duplicate-Note-Book-No8-300x300.jpg
}


10.times do
  User.create(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    phone: Faker::Base.numerify('###.###.####'),
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip,
    street_address: Faker::Address.street_address,
    avatar: Faker::Avatar.image,
    password: "password"
  )

end

# NOTE: Known User
User.create(
  name: "Lendy Friendy",
  email: "lf@lf.com",
  phone: Faker::Base.numerify('###.###.####'),
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zipcode: Faker::Address.zip,
  street_address: Faker::Address.street_address,
  avatar: Faker::Avatar.image,
  password: "password"
)


# NOTE: replace name with title
10.times do
  Book.create(
    title: Faker::Book.title,
    image: book_photos.sample,
    user_id: Faker::Number.between(1, 11),
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end



5.times do
  Movie.create(
    title: Faker::Book.title,
    image: movie_photos.sample,
    user_id: Faker::Number.between(1, 11),
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end

5.times do
  Game.create(
    title: Faker::Book.title,
    image: game_photos.sample,
    user_id: Faker::Number.between(1, 11),
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end

5.times do
  Household.create(
    title: Faker::Book.title,
    image: household_photos.sample,
    user_id: Faker::Number.between(1, 11),
    description: Faker::Lorem.paragraph)
end

5.times do
  Clothing.create(
    title: Faker::Book.title,
    image: clothing_photos.sample,
    user_id: Faker::Number.between(1, 11),
    description: Faker::Lorem.paragraph)
end

15.times do
  Loan.create(
    item_id: Faker::Number.between(1, 30),
    borrower_id: Faker::Number.between(1, 11),
    loaned: Faker::Date.between(6.days.ago, Date.today),
    returned: Faker::Date.between(2.days.ago, 1.week.from_now),
    rating: rand(1..5))
end

5.times do
  Loan.create(
    item_id: Faker::Number.between(1, 30),
    borrower_id: Faker::Number.between(1, 11),
    loaned: Faker::Date.between(6.days.ago, Date.today),
    returned: nil,
    rating: nil)
end

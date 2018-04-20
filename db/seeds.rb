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
https://rhalyns-canugo5czzvy84juz.netdna-ssl.com/wp-content/uploads/2018/01/YUETONGME-2017-new-Couture-Black-and-white-striped-long-sleeved-T-shirt-women-slim-fit-raglan-1-300x300.jpg https://cdn.shopify.com/s/files/1/2966/5302/products/product-image-305331036_300x300.jpg?v=1521000768
http://www.morimiss.com/images/201804/thumb_img/2205_thumb_G_1523556030589.jpg
https://www.alexandraroman.co.uk/wp-content/uploads/Boutique-clothing-137-300x300.jpg
http://www.gleanerlibrary.com/wp-content/uploads/2018/01/ferrari-baby-clothes-300x300.jpg
https://i1.wp.com/www.africabloom.com/wp-content/uploads/2017/05/Dashiki-African-Dashiki-Men-Kaftan-African-Clothing-Men-dashiki-shirt-African-wedding-outfit-Dashiki-plus-size-24a.jpg?resize=300%2C300&ssl=1
https://d1ic4altzx8ueg.cloudfront.net/shopping/images/hero/showpo-teenagegirlsclothing-listicle.jpg
https://i.pinimg.com/originals/29/6a/cb/296acb48ccd9b1a9ba8f606c730b1612.jpg
http://www.prodirecttennis.com/ProductImages/Thumbs/thumbs_0187133.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAeV88muzbIhicGJAjvP3K5btcnalb5n_qKemIwToIcSty6Nj29A
https://cdn.shopify.com/s/files/1/0903/2284/files/FitPromoSquarePants1_300x.jpg?v=1523510066
https://www.thinkgeek.com/images/products/frontsquare/kpgm_sw_solo_suede_jacket.jpg
https://cdn.shopify.com/s/files/1/2298/1799/products/Lovely-Kids-Baby-Girls-Striped-Rainbow-Summer-Dress-Ruffled-Short-Sleeve-Party-Pageant-Princess-Clothes-1_92319fc4-4d9a-47cf-b054-6f68faf2f634_300x300.jpg?v=1523728604
https://i5cache.dealmoon.com/thumbimg.dealmoon.com/dealmoon/ec2/3ec/710/4872049666b7b13e92dde41.jpg_300_0_13_141b.jpg
https://blvcks.com/wp-content/uploads/2018/04/4924349ao_polo_gucci_xuan_he_nam_2018_chuan_authentic-300x300.jpg
https://cdn.shopify.com/s/files/1/2966/5302/products/product-image-144272019_300x300.jpg?v=1521000609
http://www.thinkagainsaam.org/bmz_cache/3/3f41110fb352c495c806b0f578d87bae.image.300x300.jpg
https://imgix.ttcdn.co/i/product/original/0/90404-6f1b84a6c9414f9abc6d6f5986ed97fe.jpeg?q=75&auto=format%2Ccompress&w=300
https://cdn.shopify.com/s/files/1/0693/4225/products/detroit-tigers-2005-all-star-game-ornage-navy-front-LS770509_7852b83a-a9ad-4a1b-b017-22d41c0344c1_300x.jpg?v=1523651416
https://images-na.ssl-images-amazon.com/images/I/81tstXpzh7L._AC_SS300_.jpg}

movie_photos = %w{https://upload.wikimedia.org/wikipedia/commons/f/f7/Film_zone.png
https://upload.wikimedia.org/wikipedia/commons/d/d9/Wikibooks-logo_%28negative_film%29.png
https://upload.wikimedia.org/wikipedia/commons/a/a5/Fox_movies.png
https://upload.wikimedia.org/wikipedia/commons/3/3f/Theatre_white.png
https://upload.wikimedia.org/wikipedia/commons/c/c3/Films_United_Official_Company_logo.png
https://www.thoughtworthy.info/Media/Images/Member/Thumb/Everest-.jpeg
https://images-na.ssl-images-amazon.com/images/I/518C9Pet1ZL._AA300_.jpg
http://cdn02.cdn.justjared.com/wp-content/uploads/headlines/2017/04/fast-furious-9-when-does-it-come-out.jpg
http://guessthemovie-answers.com/wp-content/uploads/2014/04/guessthemovie-lrg-084.jpg
https://www.songonlyrics.net/soundtracks/wp-content/uploads/2015/03/backcountry.jpg
https://cdn.pastemagazine.com/www/blogs/lists/2011/09/05/comic-book-movies.jpg
https://www.mp3songs123.com/wp-content/uploads/2018/03/Baaghi-2-2018-Bollywood-Movie-Mp3-Songs-Download.jpg
https://lh4.googleusercontent.com/proxy/pV7BYVmp9be_okFioCS1BeqleAsX-ZDBZf5lYXYVGZ3y6uokpu8YoXL0quzl_tsYKkaDhMCMjPvmEVOBjkc0rzQTpOK-qsjftpjLHx5zVJcf2oFEOWrvm2IY-HSB=s0-d
http://www.chakranews.com/wp-content/uploads/2010/03/Slumdog-Millionaire_b-300x300.jpg
http://guessthemovie-answers.com/wp-content/uploads/2014/04/guessthemovie-lrg-062.jpg
http://www.imfdb.org/images/thumb/8/8d/AVP2_-_PC_-_Cover.jpg/300px-AVP2_-_PC_-_Cover.jpg
http://dannymaddox.com/wp-content/uploads/2012/10/Looper-1280x720-D-e1349064432742-300x300.jpg
https://images.frys.com/art/product/300x300/8985603.01.prod.jpg
http://backstagepassng.com/wp-content/uploads/2015/12/rsz_krampus-the-reckoning-poster.jpg
https://resizing.flixster.com/ztw0EVp5dSTZRfZT_u9b1CCZlP0=/300x300/v1.bjsxNzIyMDI2O2o7MTc3MDQ7MTIwMDsyNzY0OzQwOTY
http://stories.barkpost.com/wp-content/uploads/2014/04/51hmU-R8sSL._SY300_.jpg}


household_photos = %w{http://wac.edgecastcdn.net/001A39/prod/item/m3MnATt2Q8Tu53esite/2767L.png https://www.powertoolsandwoodworking.com/wp-content/uploads/2011/01/DeWalt-DC720KA-18v-Cordless-Drill-300x300.jpg https://thegrillinglife.com/wp-content/uploads/2017/04/Best-Luxury-Gas-Grills-Napoleon-Grills-Prestige-PRO-665-Liquid-Propane-Gas-Grill-300x300.jpg
http://csusga.com/s/2018/02/best-ideas-oneida-silverware-and-flatware-giraffa-etching-5-piece-place-setting-ideas-wonderful-oneida-silverware-for-dining-ideas-oneida-silverware-company-oneida-silverware-300x300.jpg https://d3v4i80726wzko.cloudfront.net/wp-content/uploads/20140604142357/TTU-U1932-EC-Set-of-Six-8-Inch-Stoneware-Salad-Plates-by-Tabletops-Gallery-300x300.jpg https://www.expatriates.com/img/37406668.3.jpg
https://i.pinimg.com/736x/9e/f1/79/9ef179185e406d8280b3e8fbb0c2528a--breakfast-set-home-gifts.jpg
https://ihfiles.com/products/47/33618/p/3/592262.jpg
https://i.pinimg.com/736x/9f/72/dc/9f72dc193b11848731007345578a934a--empanada-kitchen-small.jpg
http://thoughtcafe.co.uk/wp-content/uploads/2013/01/marigold-gloves-300x300.jpg
https://images-na.ssl-images-amazon.com/images/I/41Q%2B349GBBL._SY300_.jpg
http://giftsvilla.co.in/wp-content/uploads/2018/02/oo-2-300x300.jpg
https://images-na.ssl-images-amazon.com/images/I/51cb4eiocXL._SY300_.jpg
http://i.ebayimg.com/images/g/tI4AAOSwP4FaH0oN/s-l300.jpg
https://static1.squarespace.com/static/583c5b0de4fcb5082fd59cd5/58b606ade3df28bbfc5ee81e/58eeb1b644024303ddff19a6/1499809789031/?format=300w
http://giftsvilla.co.in/wp-content/uploads/2018/01/cc-4-300x300.jpg
http://www.anythingatsupun.lk/wp-content/uploads/2018/03/Camy-Electric-Kettle-1.5L-black-300x300.jpg
https://i.ebayimg.com/images/g/TJIAAOSw5cNYh-81/s-l300.jpg
http://www.afrugalchick.com/wp-content/uploads/2016/11/tide-pods-spring-meador-300x300.jpg
https://ihfiles.com/products/399/40264/p/3/910383.jpg
https://i.pinimg.com/736x/37/cf/17/37cf174b03761a26c3309720fc74dc7c--household-items-lift.jpg
http://www.anythingatsupun.lk/wp-content/uploads/2018/03/Geepas-tea-master-300x300.jpg
https://www.vintagefindz.com/wp-content/uploads/2017/12/pinkgl1-300x300.jpg
http://qargolink.com/wp-content/uploads/2017/02/Clear-glass-top-tv-stand-300x300.jpg
https://jollytool.com/wp-content/uploads/2017/10/productimage-picture-amerikan-tipi-firinda-tavuk-cevir2-300x300.jpg}

game_photos = %w{http://static1.squarespace.com/static/57b74d05d1758ee9c0fea868/57bb16633e00beec5114d6ad/58c6c793579fb32813b70bf6/1489509833018/zelda-main.jpg?format=1000w
http://ps3gamerzone.com/wp-content/uploads/2012/04/MPPic1-300x300.jpg
http://bookmans.com/wp-content/uploads/2017/04/Melee.png
https://images-na.ssl-images-amazon.com/images/I/41R9FArsBDL._SY300_QL70_.jpg
http://www.iheartamiibo.com/wp-content/uploads/2015/04/Kirby-and-the-Rainbow-Curse-Game-300x300.jpg
https://images.sftcdn.net/images/t_optimized,f_auto/p/30fae850-96db-11e6-a4b3-00163ec9f5fa/2483674031/temple-run-2-logo.png
https://static.wixstatic.com/media/e3b515_12836e6c2d7f447991d74466f8d0d492~mv2.gif
http://lh3.googleusercontent.com/Yak8t998sL0BOZGZpvjCi9mfuN0HqSWFEvcSxvxyV8oy46Mw9qkmpFfgdzQPE_1EzTM=w300
https://www.sbx-media.com/pimages/c8/c868cc7f-448d-48eb-9ce7-edebe35e11bd.jpg
http://vitogame.com/games/images/fireboy--watergirl-4-crystal-temple.jpg
https://www.thinkgeek.com/images/products/frontsquare/kgmt_giant_magic_8_ball.jpg
https://d2x3bkdslnxkuj.cloudfront.net/2734089_300.jpg
http://lh3.googleusercontent.com/Yak8t998sL0BOZGZpvjCi9mfuN0HqSWFEvcSxvxyV8oy46Mw9qkmpFfgdzQPE_1EzTM=w300
https://skillz-content-prod.s3.amazonaws.com/devportal2/uploads/game/icon/368/89Icon1024_-_rounded3.png
https://www.pokerhost.com/images/games/texas-holdem.jpg
https://assets.primesport.com/prod/images/Orlando%20Kickoff%20Logo.png
http://assets.funnygames.us/games/assets/tiles/7/94107/83306/300x300-350807.jpg?r=1484900707749
https://dl1.cbsistatic.com/i/2017/02/28/b620a4ed-2d6b-47b5-ae0c-a70a07456435/7e181fb2cc3d9a43d3cf2925967a337e/imgingest-505144490682303873.png
http://www.khattakgames.com/wp-content/uploads/2016/08/Download-Mame-32-Games-For-PC-Full-Version-300x300.jpg
http://www.theboardgamefamily.com/wp-content/uploads/2016/11/RubiksRaceBox.jpg}

book_photos = %w{http://commonsladiesclub.com/wp-content/uploads/2014/12/Books-300w.jpg
https://bostonbookfest.org/wp-content/uploads/2016/03/Store_product_2012poster_300x300.jpg
http://www.pikidsmedia.com/sites/default/files/styles/square/public/images/titles/00155000_0.jpg?itok=KNNC5-8i
http://thekwakbrothers.com/wp-content/uploads/2016/04/book-dribbb-300x300.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_IPejACIr_czav9Pzr1AShG3iLnQ0QWj7Vb9FMb6xKOhT-i_4
http://www.nandastationers.com/wp-content/uploads/2016/06/Senior-Duplicate-Note-Book-No8-300x300.jpg http://abpaonline.org/wp-content/uploads/logo-scout-books-and-media.jpg
https://project-management.com/wp-content/uploads/2014/02/the-software-project-managers-bridge-to-agility-book-cover.jpg
http://abpaonline.org/wp-content/uploads/logo-scout-books-and-media.jpg
https://www.powerliftinguniversity.com/wp-content/uploads/2015/08/Starting-Strength-Powerlifting-Books-300x300.jpg
https://www.ziglar.com/wp-content/uploads/cache/2018/04/raising_positive_kids_in_a_negative_world/387837156.jpg
https://s3.amazonaws.com/cdn.strombergschickens.com/images/uploads/GRDG-Goat-Book-MED.jpg
https://static1.squarespace.com/static/51f4ed95e4b04b5d7e630997/t/521bf8f7e4b036e9c3517c98/1377564919882/yangyong2.jpg?format=300w
https://www.kirnazabete.com/media/catalog/product/cache/1/image/300x/5e06319eda06f020e43594a9c230972d/h/a/hachns974nocos-289/KirnaZabete-Hachette-Books-Grace:-The-American-Vogue-Years-31.jpg
https://www.pragmaticmom.com/wp-content/uploads/2012/05/12662988.jpeg
http://www.concordmonitor.com/getattachment/fd8ad1f0-4bfb-4d67-ba27-8f4999309660/Review-Book-shows-Apollo-8-was}


130.times do
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
30.times do
  Book.create(
    title: Faker::Book.title,
    image: book_photos.sample,
    user_id: Faker::Number.between(1, 131),
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end


20.times do
  Movie.create(
    title: Faker::Book.title,
    image: movie_photos.sample,
    user_id: Faker::Number.between(1, 131),
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end

35.times do
  Game.create(
    title: Faker::Book.title,
    image: game_photos.sample,
    user_id: Faker::Number.between(1, 131),
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph)
end

45.times do
  Household.create(
    title: Faker::Book.title,
    image: household_photos.sample,
    user_id: Faker::Number.between(1, 131),
    description: Faker::Lorem.paragraph)
end

50.times do
  Clothing.create(
    title: Faker::Book.title,
    image: clothing_photos.sample,
    user_id: Faker::Number.between(1, 131),
    description: Faker::Lorem.paragraph
  )
end

115.times do
  Loan.create(
    item_id: Faker::Number.between(1, 180),
    borrower_id: Faker::Number.between(1, 131),
    loaned: Faker::Date.between(6.days.ago, Date.today),
    returned: Faker::Date.between(2.days.ago, 1.week.from_now),
    rating: rand(1..5)
  )
end

40.times do
  Loan.create(
    item_id: Faker::Number.between(1, 180),
    borrower_id: Faker::Number.between(1, 131),
    loaned: Faker::Date.between(6.days.ago, Date.today),
    returned: nil,
    rating: nil
  )
end

10.times do
  Loan.create(
    item_id: Faker::Number.between(1, 180),
    borrower_id: Faker::Number.between(1, 131),
    loaned: Faker::Date.between(3.weeks.ago, 2.weeks.ago),
    returned: nil,
    rating: nil,
    overdue: true
  )
end

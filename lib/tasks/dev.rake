namespace :dev do

   task :fake_movie_and_buyers => :environment do
    User.delete_all
    Movie.delete_all

    users = []
    users << User.create!( :email => "admin@example.org", :password => "12345678" )

    10.times do |i|
      users << User.create!( :email => Faker::Internet.email, :password => "12345678")
      puts "Generate User #{i}"
    end

     movie = Movie.create!( :status => "public",  :title => "全栈营 Meetup", :friendly_id => "fullstack-meetup", :user_id => users.sample.id)
     t1 = movie.tickets.create!( :name => "一般用户", :price => 50)
     t2 = movie.tickets.create!( :name => "普通VIP", :price => 80)
     t3 = movie.tickets.create!( :name => "高级VIP", :price => 120)


     1000.times do |i|
       movie.buyers.create!( :status => ["pending", "confirmed"].sample,
                                    :ticket => [t1,t2,t3].sample,
                                    :name => Faker::Cat.name, :email => Faker::Internet.email,
                                    :cellphone => "12345678", :bio => Faker::Lorem.paragraph,
                                    :created_at => Time.now - rand(10).days - rand(24).hours )
     end

     puts "Let's visit http://localhost:3000/admin/movies/fullstack-meetup/buyers"
   end


end

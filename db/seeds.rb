User.destroy_all

u1 = User.create :first_name => 'Nelly', :last_name => 'Dai', :email => 'nelly@ga.com', :admin => true, :password => "chicken"
u2 = User.create :first_name => 'David', :last_name => 'Johnson', :email => 'david@ga.com', :admin => true, :password => "chicken"
u3 = User.create :first_name => 'Audrey', :last_name => 'Patricia', :email => 'audrey@ga.com', :admin => true, :password => "chicken"
u4 = User.create :first_name => 'Dora', :last_name => 'Lin', :email => 'dora@ga.com', :frequency => "fortnightly"
u5 = User.create :first_name => 'Natalie', :last_name => 'Mendes', :email => 'natalie@ga.com', :frequency => "weekly"

puts "#{ User.count } users created"

Topic.destroy_all

t1 = Topic.create :name => "deals"
t2 = Topic.create :name => "special events"
t3 = Topic.create :name => "news"

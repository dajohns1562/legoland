User.destroy_all

u1 = User.create :first_name => 'Nelly', :last_name => 'Dai', :email => 'nelly@ga.com', :admin => true, :password => "chicken"
u2 = User.create :first_name => 'David', :last_name => 'Johnson', :email => 'david@ga.com', :admin => true, :password => "chicken"
u3 = User.create :first_name => 'Audrey', :last_name => 'Patricia', :email => 'audrey@ga.com', :admin => true, :password => "chicken"
u4 = User.create :first_name => 'Dora', :last_name => 'Lin', :email => 'dora@ga.com', :frequency => "fortnightly"
u5 = User.create :first_name => 'Natalie', :last_name => 'Mendes', :email => 'natalie@ga.com', :frequency => "weekly"
u6 = User.create :first_name => 'Joel', :last_name => 'Turnbull', :email => 'joel@ga.com', :frequency => "monthly"
u7 = User.create :first_name => 'Mai', :last_name => 'Nguyen', :email => 'mai@ga.com', :frequency => "weekly"
u8 = User.create :first_name => 'Kimberley', :last_name => 'Osborn', :email => 'kimberley@ga.com', :frequency => "weekly"
u9 = User.create :first_name => 'Katie', :last_name => 'Lugton', :email => 'katie@ga.com', :frequency => "fortnightly"

puts "#{ User.count } users created"

Topic.destroy_all

t1 = Topic.create :name => "Exclusive Deals"
t2 = Topic.create :name => "Special Events"
t3 = Topic.create :name => "News"
t4 = Topic.create :name => "First Look Previews"

puts "#{ Topic.count } topics created"


############## ASSOCIATIONS ###########

puts "user and topics association"
u4.topics << t1 << t2
u5.topics << t2 << t3
u6.topics << t1 << t2 << t3 << t4
u7.topics << t4
u8.topics << t1 << t2
u9.topics << t1 << t3 << t4

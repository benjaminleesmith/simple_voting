Factory.define :user do |u|
  u.email 'test@example.com'
  u.password 'password'
  u.votes_left 2
end

Factory.define :admin, :class => User do |u|
  u.email 'admin@example.com'
  u.password 'password'
  u.votes_left 2
  u.admin true
end
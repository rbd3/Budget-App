# db/seeds.rb

# Create Users
user1 = User.create!(
  name: 'User1',
  email: 'user1@example.com',
  password: 'password',
  confirmed_at: Time.now
)

user2 = User.create!(
  name: 'User2',
  email: 'user2@example.com',
  password: 'password',
  confirmed_at: Time.now
)

# Create Groups
group1 = user1.groups.create!(
  name: 'Group1',
  icon: 'https://www.google.com/search?q=image+of+food&sca_esv=584789655&ei=eu5eZeWREvOxhbIP2umiwAY&ved=0ahUKEwjltobTvNmCAxXzWEEAHdq0CGgQ4dUDCBA&uact=5&oq=image+of+food&gs_lp=Egxnd3Mtd2l6LXNlcnAiDWltYWdlIG9mIGZvb2QyBxAAGIAEGBMyCRAAGIAEGBMYCjIHEAAYgAQYEzIHEAAYgAQYEzIJEAAYgAQYExgKMgcQABiABBgTMgkQABiABBgTGAoyBxAAGIAEGBMyBxAAGIAEGBMyCRAAGIAEGBMYCkj3LFCvCVjWKnABeACQAQGYAYIDoAG5JaoBBjItMTIuNLgBA8gBAPgBAcICBxAAGB4YsAPCAgYQABgeGA3CAgUQABiABMICBhAAGBYYHsICCBAAGBYYHhgKwgIFEC4YgATiAwQYASBBiAYBkAYB&sclient=gws-wiz-serp#vhid=p0SEX--YsWV85M&vssid=l'
)

group2 = user2.groups.create!(
  name: 'Group2',
  icon: 'Icon2'
)

# Create Operations
operation1 = user1.operations.create!(
  name: 'Operation1',
  amount: 100.00
)

operation2 = user2.operations.create!(
  name: 'Operation2',
  amount: 150.00
)

# Associate Groups and Operations
group1.operations << operation1
group2.operations << operation2

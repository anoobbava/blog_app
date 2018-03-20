# encoding: utf-8

require 'faker'

# User
# ===========
  for index in 1..5 do
    profile_pic = File.join(Rails.root, "sample_pics/profile_images/profile_#{index}.jpg")
    img_file = File.new(profile_pic)
    User.new(email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    user_name: Faker::Internet.user_name(8),
    password: '123456789',
    password_confirmation: '123456789',
    confirmed_at: Time.now,
    image: img_file ).save(validate: false)
  end

# Admin User
# ==============================
  profile_pic = File.join(Rails.root, "sample_pics/profile_images/admin.jpeg")
  src_file = File.new(profile_pic)
  User.new(email: 'admin@blogapp.com',
          first_name: 'admin_first',
          last_name: 'admin_last',
          user_name: 'admin_user',
          password: 'admin@123',
          password_confirmation: 'admin@123',
          confirmed_at: Time.now,
          image: src_file).save(validate: false)

# Categories
# ==================================
  5.times do
    Category.find_or_create_by(name: Faker::Lorem.word, description: Faker::Lorem.characters(10))
  end

# articles
# ====================================

  for index in 1..5 do
    Article.find_or_create_by(title: Faker::Book.title,
                              content: Faker::Lorem.paragraph,
                              user: User.find(index))
  end

# Comments
# ====================================

  for index in 1..5 do
    for kindex in 1..5 do
      Comment.find_or_create_by(description: Faker::Lorem.paragraph, user: User.find(index),
                                article: Article.find(index))
    end
  end

# article_categories
# ===================================

  for index in 1..5 do
    ArticleCategory.find_or_create_by(article: Article.find(index), category: Category.find(index))
  end

# article_attachments
# ===================================

  for index in 1..5 do
    for kindex in 1..5 do
      article = Article.find(index)
      article_pic = File.join(Rails.root,"sample_pics/article_images/article_#{kindex}.jpg")
      src_file = File.new(article_pic)
      ArticleAttachment.create!(article: article, image: src_file)
    end
  end

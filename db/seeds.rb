include RandomData

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create a Unique Post
Post.find_or_create_by(
  title: "This is a unique post",
  body: "Just one of a kind post"
)

# Create a Unique comment
Comment.find_or_create_by(
  post: posts.sample,
  body: "First time commenting!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

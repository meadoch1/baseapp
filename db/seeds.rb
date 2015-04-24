# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
unless User.find_by_username('admin')
  u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
  )
  u.skip_confirmation!
  u.save!
end


# Test user accounts
(1..50).each do |i|
  username = "user#{i}"
  unless User.find_by_username(username)
    u = User.new(
      username: username,
      email: "user#{i}@example.com",
      password: "1234",
      password_confirmation: "1234"
    )
    u.skip_confirmation!
    u.save!
  end

  puts "#{i} test users created..." if (i % 5 == 0)
end

def create_lessons(course, count)
  (1..count).each do |i|
    Lesson.find_or_create_by(name: "Course #{course.order_nr} Lesson #{i}") do |lesson|
      lesson.course = course
      lesson.order_nr = i
    end
  end
end

curriculum = Curriculum.find_or_create_by(name: "Level 1") do |curr|
  curr.description = "The first curriculum for clients."
end
course = Course.find_or_create_by(name: "Ultimate Questions") do |c|
  c.description = "This is a study of John Blanchard’s pamphlet entitled Ultimate Questions. This course presents God as the Great Creator and Redeemer of this world."
  c.level = 1
  c.order_nr = 1
  c.curriculum = curriculum
end
create_lessons(course, 12)

course = Course.find_or_create_by(name: "Biblical Christian Truths") do |c|
  c.description = "This course is a biblically-based overview of the major doctrines of the Bible: The Doctrine of God, Man, Jesus Christ, Salvation and the Kingdom of God."
  c.level = 1
  c.order_nr = 2
  c.curriculum = curriculum
end
create_lessons(course, 17)


curriculum = Curriculum.find_or_create_by(name: "Level 2") do |curr|
  curr.description = "The first curriculum for clients."
end
course = Course.find_or_create_by(name: "Am I Good Enough?") do |c|
  c.description = "This course is a biblically-based in-depth study of salvation by grace, God’s justice and mercy, the fall, reconciliation, call, repentance, saving faith, justification, sanctification, perseverance, and the Christian life."
  c.level = 2
  c.order_nr = 1
  c.curriculum = curriculum
end
create_lessons(course, 15)

course = Course.find_or_create_by(name: "All Things Under His Feet") do |c|
  c.description = "This course is a study of the book of Ephesians using John Stott’s book entitled The Message of Ephesians."
  c.level = 2
  c.order_nr = 2
  c.curriculum = curriculum
end
create_lessons(course, 11)

course = Course.find_or_create_by(name: "Learning to Live a Godly Life") do |c|
  c.description = "This course is a study of the book of James, using Gordon Keddie’s book The Practical Christian. "
  c.level = 2
  c.order_nr = 3
  c.curriculum = curriculum
end
create_lessons(course, 7)

# Street addresses
AddressType.find_or_create_by(id: 1) { |a| a.name = "Home" }
AddressType.find_or_create_by(id: 2) { |a| a.name = "Office" }
AddressType.find_or_create_by(id: 3) { |a| a.name = "Prison" }

FacilityType.find_or_create_by(id: 1) {|f| f.name = "State Prison"; f.code = "SP"}
FacilityType.find_or_create_by(id: 2) {|f| f.name = "Federal Prison"; f.code = "FP"}


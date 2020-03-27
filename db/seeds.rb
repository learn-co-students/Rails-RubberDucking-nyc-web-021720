
Student.delete_all
Duck.delete_all

students = []

10.times do
  students << Student.create!(name: Faker::Name.unique.name, mod: rand(1..5))
end

25.times do
  Duck.create!(name: Faker::FunnyName.unique.name, description: Faker::Hipster.sentence(word_count: 3), student: students.sample)
end

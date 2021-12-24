# Reset DB
User.destroy_all
Project.destroy_all
Cast.destroy_all
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Seed Data

[1, 2].each do |num|
  User.create!(
    username: "User #{num}",
    first_name: "FirstName#{num}",
    last_name: "LastName#{num}",
    email: "email#{num}@email.com",
    password: 'password',
    password_confirmation: 'password',
    bio: "Awesome user number #{num}"
  )
end

[1, 2, 3, 4, 5].each do |num|
  Project.create!(
    title: "Project #{num}",
    summary: "Summary for project #{num}"
  )
end

Cast.create!(
  description: 'hello',
  project_id: 1,
  position: 1
)

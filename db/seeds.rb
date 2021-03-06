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

projects = (1..20).map do |num|
  Project.create!(
    title: "Project #{num}",
    summary: "Summary for project #{num}"
  )
end

projects.each do |proj|
  2.times do
    Cast.create!(
      position: (0..6).to_a.sample,
      description: 'Role of the year',
      project_id: proj.id,
      user_id: [User.first.id, User.last.id].sample
    )
  end
end

projects[15..].each do |proj|
  Cast.create!(
    position: (0..6).to_a.sample,
    description: 'Role of the year',
    project_id: proj.id,
  )
end

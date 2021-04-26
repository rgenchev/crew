dev_team = Team.create!(name: "Development")
acc_team = Team.create!(name: "Accounting")
hr_team = Team.create!(name: "Human Resource")
prod_team = Team.create!(name: "Production")

User.create!(email: "radoslav@example.com", password: "password", name: "Radoslav Genchev", team: dev_team)

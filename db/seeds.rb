# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  School.create(name: "Wilson Elementary")
  School.create(name: "Lakeview Middle")

Teacher.create(name: 'Mrs. Smith', grade_taught: 1, school_id: 1)
Teacher.create(name: 'Mr. Bondwell', grade_taught: 3, school_id: 1)
Teacher.create(name: 'Mrs. Jenkins', grade_taught: 4, school_id: 1)
Teacher.create(name: 'Mrs. Doubtfire', grade_taught: 5, school_id: 1)
Teacher.create(name: 'Mr. Greggs', grade_taught: 7, school_id: 2)
Teacher.create(name: 'Mrs. Clark', grade_taught: 8, school_id: 2)

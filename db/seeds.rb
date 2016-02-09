# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'admin', password: 'password', is_admin: true)

james = User.create(username: 'james.franco', password: 'password')
ethan = User.create(username: 'ethan.hawke', password: 'password')


flynn = james.dogs.create name: 'Flynn', breed: 'Border Collie'
amber = ethan.dogs.create name: 'Amber', breed: 'Border Collie'
sunny = ethan.dogs.create name: 'Sunny', breed: 'Border Collie - Medium Spitz Mix'


flynn.tricks.create [
  {name: 'bang', description: 'play dead'},
  {name: 'sneakers', description: 'seek and bring to me my sneakers'},
  {name: 'bark', description: 'using a gesture (palm towards the dog, and clench a few times) dog barks'},
]

amber.tricks.create [
  {name: 'puff', description: 'play dead'},
  {name: 'jump', description: 'jump up where you are'},
  {name: 'walk around', description: 'stand up onto rear legs and circle around me'},
  {name: 'bow', description: 'downward dog yoga position'},
]

sunny.tricks.create [
  {name: 'forward', description: 'go forward'},
  {name: 'back', description: 'go backward'},
  {name: 'sit', description: 'sits'},
  {name: 'beg', description: 'bunny position: sitting with front legs held in front'},
  {name: 'walk around', description: 'on two legs walk around me'},
  {name: 'circle around', description: 'circle forward around me'},
  {name: 'circle around backwards', description: 'circle backward around me'},
  {name: 'left hand', description: 'holds up front-left leg'},
  {name: 'right hand', description: 'holds up front-right leg'},
]

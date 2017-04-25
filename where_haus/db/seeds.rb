# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Warehouse.destroy_all

users = User.create([
    {firstname:"Blep",
    lastname:"Blepo",
    email:"Blepo@gmail.com",
    phone_number: "323-696-1337",
    company:"Bleplium.co",
    password:"Bleptastic"}
  ])

events = Event.create([
    {event_name:"Break the Haus Down: hardstyle", date:"02/01/2017", price:"$50"},
    {event_name:"A State of Trance", date:"05/25/2017", price:"$80"}
  ])

warehouses = Warehouse.create([
    {venue_name:"Boiler Room", location:"W Elm St. 90512", num_exits:"5", max_occupants:"1000", square_feet:"6000", description:"It's on FIRE!"},
    {venue_name:"Hot Box", location:"nowhere rd. 10029", num_exits:"1", max_occupants:"400", square_feet:"1000", description:"Gas Leak!"},
    {venue_name:"Angel Airways", location:"1st St.", num_exits:"4", max_occupants:"540", square_feet:"2000", description:"It was great!"},
    {venue_name:"Singles", location:"N Los Feliz Ave. 90089 ", num_exits:"3", max_occupants:"30", square_feet:"600", description:"I dont remember what happened we lost my friend!"}
  ])

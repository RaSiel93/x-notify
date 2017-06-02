# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Discount.delete_all
Event.delete_all
Adv.delete_all

dis = Discount.create(discription: "ssdfdf")
event = Event.create(discription: "nsthydf")
adv = Adv.create(discription: "qsqwedf")

Item.delete_all
Item.create(item_type: dis.class, item_id: dis.id)
Item.create(item_type: event.class, item_id: event.id)
Item.create(item_type: adv.class, item_id: adv.id)
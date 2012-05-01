# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Canvas.destroy_all
Mind.destroy_all
canvas = 5.times.collect {|i| Canvas.create(name: "canvas#{i}") }
positions = [{top: 100, left: 100}, 
             {top: 100, left: 100}, 
             {top: 200, left: 200}, 
             {top: 200, left: 200}, 
             {top: 300, left: 300}]
canvas.each_with_index do |canvas, i|
  positions.each_with_index do |position, j|
    canvas.minds << Mind.create(name: "mind_#{i}_#{j}",
                                top: position[:top],
                                left: position[:left])
  end
end

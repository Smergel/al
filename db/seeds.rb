# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: "jacob.smergel@gmail.com", password: "jelly1234" },
  { email: "wmconlow@gmail.com", password: "willy1234" }
])

Event.create([{ date: (2015-10-10), event_body: "Seed Me", link: nil }])
Leaderboard.create([{ user_id: 1, score: 10, time: 1 }])
Songlist.create([{ name: 'AlbumeExchange' }])

games = Game.create([
  { youtube: 'https://www.youtube.com/watch?v=xGytDsqkQY8', songlist_id: 1, artist: 'Semisonic' },
  { youtube: 'https://www.youtube.com/watch?v=5yxCwuKSnMI', songlist_id: 1, artist: 'Colbert' }
  ])

posts = Post.create([
  { user_id: 1, band_name: "Tame Impala", album_name: "Neverland For Tomorrow",
   write_up: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
youtube: "https://www.youtube.com/watch?v=wycjnCCgUes", date: (2015-10-10), band_pic: "http://okp-cdn.okayplayer.com/wp-content/uploads/2015/03/tame-impala-let-it-happen-mp3-us-tour-dates-715x429.jpg",
album_art: "http://static.stereogum.com/uploads/2015/07/12102942/TameImpala-Currents-560x560-560x560.jpg",
quote: "This is the time!"}
  ])


require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
        name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      }, {
        name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      }, {
        name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      }, {
        name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      }, {
        name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
        name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      }, {
        name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10 
      }, {
        name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      }, {
        name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      }, {
        name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12
      }]
    }
  }
end

def num_points_scored(player_name)
  game_hash.reduce(0) do |sum, (location, team_data)|

    player_array = team_data[:players]
    count = 0
    while count < player_array.length do
      if player_array[count][:name] == player_name
        return player_array[count][:points]
      end
      count += 1
    end
  end
end

def shoe_size(player_name)
  game_hash.reduce(0) do |sum, (location, team_data)|

    player_array = team_data[:players]
    count = 0
    while count < player_array.length do
      if player_array[count][:name] == player_name
        return player_array[count][:shoe]
      end
      count += 1
    end
  end
end

def team_colors(team_name)
  game_hash.reduce([]) do |colors, (location, team_data)|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams_array = [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
  ]
end

def player_numbers(team_name)
  game_hash.reduce([]) do |memo, (location, team_data)|
    if (team_data[:team_name] == team_name)
      roster = team_data[:players]
      
      count = 0 
      while count < roster.length do
        memo.push(roster[count][:number])
        count += 1
      end
    end
    memo
  end
end

def player_stats(player_name)
  game_hash.reduce({}) do |memo, (location, team_data)|

    player_array = team_data[:players]
    count = 0
    while count < player_array.length do
      if player_array[count][:name] == player_name
        player_array[count].delete(:name)
        return player_array[count]
      end
      count += 1
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|

    player_array = team_data[:players]
    
    count = 0
    while count < player_array.length do
      if player_array[count][:shoe] > biggest_shoe
        biggest_shoe = player_array[count][:shoe]
        rebounds = player_array[count][:rebounds]
      end
      count += 1
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  name = ""
  game_hash.each do |location, team_data|

    player_array = team_data[:players]
    
    count = 0
    while count < player_array.length do
      if player_array[count][:points] > most_points
        most_points = player_array[count][:points]
        name = player_array[count][:name]
      end
      count += 1
    end
  end
  name
end

def sum_points(location)
  data = game_hash[location][:players]
  count = 0 
  sum = 0
  while count < data.length do 
    sum += data[count][:points]
    count += 1
  end
  sum  
end
  
def winning_team
  home_total = sum_points(:home)
  away_total = sum_points(:away)
  
  if home_total > away_total 
    return game_hash[:home][:team_name]
  elsif away_total > home_total
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|

    player_array = team_data[:players]
    
    count = 0
    while count < player_array.length do
      if player_array[count][:name].length > longest_name.length
        longest_name = player_array[count][:name]
      end
      count += 1
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  steal_name = ""
  bool = false
  game_hash.each do |location, team_data|

    player_array = team_data[:players]
    
    player_array.each do |player|
      if player[:points] > most_steals
        most_steals = player[:points]
        steal_name = player[:name]
      end
    end
  end
  if steal_name = player_with_longest_name 
    bool = true 
  end
  bool
end





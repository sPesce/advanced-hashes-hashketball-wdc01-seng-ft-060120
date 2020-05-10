require 'pry'
# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
 game = game_hash
 game.each{|(key_out, value_out)|
  value_out[:players].each{|player_hash|
    if (player_hash[:player_name] == name)
      return player_hash[:points]
    end 
  }
 }
end

def shoe_size(name)
  game = game_hash
   game.each{|(key_out, value_out)|
  value_out[:players].each{|player_hash|
    if (player_hash[:player_name] == name)
      return player_hash[:shoe]
    end 
  }
 }
end

def team_colors(team_name)
  game = game_hash
  colors = game.each{|(key,val)|
    if val[:team_name] == team_name
      return val[:colors]
    end 
  }
end

def team_names
  game = game_hash
  names = game.reduce([]){|name_arr, (key,val)|
    name_arr << val[:team_name]
    name_arr
  }
end 

def player_numbers(team_name)
  game = game_hash
  nums = game.reduce([]){|num_arr, (key,val)|
    if(team_name == val[:team_name])
      val[:players].each{|player_hash|
        num_arr << player_hash[:number]
      }
    end
    num_arr
  }
end

def player_stats(name)
  game = game_hash
  
  stats = game.reduce({}){|player_stat_hash, (key,val)|
    val[:players].each{|player|
    
    
    if (player[:player_name] == name)
      player.each{|(stat_key, stat_val)|
        #if(stat_key != :player_name)
          player_stat_hash[stat_key] = stat_val
        #end
      }
    end
    }
    player_stat_hash  
    }
    
end

def big_shoe_rebounds
  max_shoe = -1
  player = {}
  
  game = game_hash
  game.each{|(key_out, val_out)|
    val_out[:players].each{|player_hash|
      if(player_hash[:shoe] > max_shoe)
        player = player_hash
        max_shoe = player_hash[:shoe]
      end
    }
  }
  player[:rebounds]
end

def most_points_scored
  max_points = -1
  player = {}
  
  game = game_hash
  game.each{|(key_out, val_out)|
    val_out[:players].each{|player_hash|
      if(player_hash[:points] > max_points)
        player = player_hash
        max_points = player_hash[:points]
      end
    }
  }
  player[:player_name]
end

def winning_team_score
  hash = winning_team_hash
  hash[:score]
end
def winning_team 
  hash = winning_team_hash
  hash[:team_name]
end

def winning_team_hash
  game = game_hash
  
  game.each{|(key_out, val_out)|
    val_out[:total_score] = 0
    val_out[:players].each{|player_hash|
    game[key_out][:total_score] += player_hash[:points]
    }
  }
  if(game[:home][:total_score] > game[:away][:total_score])
    
    {:score => game[:home][:total_score], :team_name => game[:home][:team_name]} 
  else
    {:score => game[:away][:total_score], :team_name => game[:away][:team_name]}
  end
end

def player_with_longest_name
  game = game_hash
  long_name = ""
  
  game.each{|(key_out,val_out)|
    val_out[:players].each{|player|
      if(player[:player_name].length > long_name.length)
        long_name = player[:player_name] 
      end
    }
  }
  long_name 
end

max_pts = num_points_scored(most_points_scored)
puts "-------- Bonus --------\n\n"
puts "#{most_points_scored} scored the most points this game, with a score of #{max_pts}.\n\n"

puts "#{winning_team} won the game with #{winning_team_score} points.\n\n"

puts "The player with the longest name is \'#{player_with_longest_name}\'.\nHis name is #{player_with_longest_name.length} chars long."

require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      @team = Team.new(params)
      # @super_heroes = Hero.new(params["team"]["members"][0]["name"],
      #     params["team"]["members"][0]["power"],
      #     params["team"]["members"][0]["bio"])
      members = params["team"]["members"]
      @super_heroes = members.map do |member|
        Hero.new(member["name"], member["power"], member["bio"])
        end
        # binding.pry
      erb :team
    end
end

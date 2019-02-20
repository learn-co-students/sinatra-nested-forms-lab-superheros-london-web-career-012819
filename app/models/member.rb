class Member

  attr_reader :name, :power, :biography

  @@all = []

  def initialize(name:, power:, biography:)
    @name = name
    @power = power
    @biography = biography

    @@all << self
  end

  def self.create_all(members_array)
    members_array.each do |member|
      self.new(name: member[:name], power: member[:power], biography: member[:biography])
    end
  end

  def self.all
    @@all
  end
end

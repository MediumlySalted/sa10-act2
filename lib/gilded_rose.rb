module GildedRose
  def self.new(name:, days_remaining:, quality:)
    klass_new(name).new(days_remaining, quality)
  end

  def self.klass_new(name)
    case name
    when 'Normal Item'
      Normal
    when 'Aged Brie'
      Brie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfras
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage
    end
  end

  class Normal
    attr_reader :days_remaining, :quality

    def initialize(days_remaining, quality)
      @days_remaining = days_remaining
      @quality = quality
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end

  end


  class Brie
    attr_reader :days_remaining, :quality

    def initialize(days_remaining, quality)
      @days_remaining = days_remaining
      @quality = quality
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end

  end


  class Sulfras
    attr_reader :days_remaining, :quality

    def initialize(days_remaining, quality)
      @days_remaining = days_remaining
      @quality = quality
    end

    def tick
    end

  end


  class Backstage
    attr_reader :days_remaining, :quality

    def initialize(days_remaining, quality)
      @days_remaining = days_remaining
      @quality = quality
    end

    def tick
      @days_remaining -= 1
      return              if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end

  end


end

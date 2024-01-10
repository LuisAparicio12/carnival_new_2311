class Visitor
    attr_reader :name, :height, :spending_money, :preferences
    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money.to_s.delete("$").to_i
        @preferences = []
    end 

    def add_preference(preference)
        @preferences << preference
    end 

    def tall_enough?(height_in_inches)
        if  @height >= height_in_inches
            true
        else 
            false
        end
    end 
end
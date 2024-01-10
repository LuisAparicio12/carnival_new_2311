class Ride 
    attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
    attr_writer :admission_fee
    def initialize(hash)
        @name = hash[:name]
        @min_height = hash[:min_height]
        @admission_fee = hash[:admission_fee]
        @excitement = hash[:excitement]
        @total_revenue = 0
        @rider_log = {}
    end

    def can_board?(visitor)
        visitor.height >= @min_height && visitor.preferences.include?(@excitement) && visitor.spending_money >= @admission_fee
    end

    def board_rider(visitor)
        if can_board?(visitor)
            @rider_log[visitor.name] = @rider_log.fetch(visitor.name, 0) + 1  
            visitor.spending_money -= @admission_fee  
            @total_revenue += @admission_fee  
        end
    end 
end 
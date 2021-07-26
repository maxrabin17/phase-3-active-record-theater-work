class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:location)
    end

    def lead
        if (self.auditions.find_by(hired: true)) 
            self.auditions.find_by(hired: true)  
        else
            'no actor has been hired for this role'
        end
    end

    def understudy
        if (self.auditions.where(hired: true).second)
            self.auditions.where(hired: true).second 
        else
            'no actor has been hired for understudy for this role'
        end
    end

end
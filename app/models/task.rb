class Task < ApplicationRecord
    validates:status,presence:true,length:{maximum:255}
    validates:content,presence:true,length:{maximum:255}
end

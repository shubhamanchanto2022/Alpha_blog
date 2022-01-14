class Article < ApplicationRecord 
    validates :Title , presence: true , length: {minimum: 4,maximum: 100}
    validates :Description ,presence: true, length: {minimum: 5,maximum: 200}
end
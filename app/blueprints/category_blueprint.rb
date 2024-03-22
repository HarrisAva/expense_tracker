# frozen_string_literal: true

class CategoryBlueprint < Blueprinter::Base
    identifier :id
   
    view :normal do
        fields :name
    end
end

# frozen_string_literal: true

class ExpenseBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :date, :title, :amount
        # display expense.category.name 
        association :category, blueprint: CategoryBlueprint, view: :normal
    end

    view :extended do
        fields :date, :title, :amount, :description
        # display expense.category.name
        association :category, blueprint: CategoryBlueprint, view: :normal
    end
end

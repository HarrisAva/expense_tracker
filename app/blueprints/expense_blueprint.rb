
class ExpenseBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :date, :title, :amount
        association :category, blueprint: CategoryBlueprint, view: :normal
    end

    view :extended do
        fields :date, :title, :amount, :description
        association :category, blueprint: CategoryBlueprint, view: :normal
    end
end

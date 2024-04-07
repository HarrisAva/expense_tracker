
class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
      fields :username, :email, :first_name, :last_name
    end

    view :me do
      fields :first_name, :last_name, :username, :email
  end
  
  end
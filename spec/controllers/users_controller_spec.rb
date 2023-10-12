require 'rails_helper'

describe UsersController, type: :controller do
 it { should use_before_action(:authenticate_user!) }
end

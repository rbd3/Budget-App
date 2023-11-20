class OperationsController < ApplicationController
    load_and_authorize_resource through: :group
end

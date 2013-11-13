class PetitionsController < ApplicationController
  load_and_authorize_resource only: [:index]
end
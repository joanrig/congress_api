class MembersController < ApplicationController

  # format.json { render json: {all_data: {data: @data, data1: @data1}

 #  def index
 #   @vacations = @user.vacations
 #   respond_to do |format|
 #     format.html { render :index }
 #     format.json { render json: @vacations}
 #   end
 # end

  def index
    @senators = Member.senators
    respond_to do |format|
      format.json { render json: @senators}
    end
  end
end

# senators_by_seniority = Member.senators_by_seniority
# senate_loyalists = Member.senate_loyalists
# senate_mavericks = Member.senate_mavericks
# senators_missed_votes = Member.senators_with_most_missed_votes
# female_senators = Member.female_senators
# democratic_senators = Member.democratic_senators
# female_democracratic_senators = Member.female_democratic_senators
# republican_senators = Member.republican_senators
# female_republican_senators = Member.female_republican_senators
#
# reps = Member.reps
# reps_by_seniority = Member.reps_by_seniority
# house_loyalists = Member.house_loyalists
# house_mavericks = Member.house_mavericks
# reps_missed_votes = Member.reps_with_most_missed_votes
# female_reps = Member.female_reps
# democratic_reps = Member.democratic_reps
# female_democracratic_reps = Member.female_democratic_reps
# republican_reps = Member.republican_reps
# female_republican_reps = Member.female_republican_reps

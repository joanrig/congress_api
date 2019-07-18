class MembersController < ApplicationController

  def search
    term = params[:term]
    case term
    when "senators"
      response = Member.senators

    when "senators_by_seniority"
      response = Member.senators_by_seniority

    when "senate_loyalists"
      response = Member.senate_loyalists

    when "senate mavericks"
      response = Member.senate mavericks

    when "truant_senators"
      response = Member.truant_senators

    when "female_senators"
      response = Member.female_senators

    when "democratic_senators"
      response = Member.democratic_senators

    when "female_democratic_senators"
      response = Member.female_democratic_senators

    when "republican_senators"
      response = Member.republican_senators

    when "female_republican_senators"
      response = Member.female_republican_senators

    when "reps"
      response = Member.reps

    when "reps_by_seniority"
      response = Member.reps_by_seniority

    when "house_party_loyalists"
      response = Member.house_party_loyalists

    when "house_mavericks"
      response = Member.house_mavericks

    when "truant_reps"
      response = Member.truant_reps

    when "female_reps"
      response = Member.female_reps

    when "democratic_reps"
      response = Member.democratic_reps

    when "republican_reps"
      response = Member.republican_reps

    when "female_republican_reps"
      response = Member.female_republican_reps

    else
      response={error:"not found, please try again"}
    end

    render json: response
  end

  def index
    @members = Member.all
    render json: @members
  end

  def show
    @member = Member.find_by_id(params :id)
    render json: @member
  end

  def destroy
  end
end

class College< ActiveRecord::Base
	has_many :user_colleges
	has_many :users, through: :user_colleges


	def self.valid_params?(params)
    return !params[:college][:name].empty? && !params[:college][:enrollment].empty? && !params[:college][:tuition].empty? && !params[:college][:acceptance_rate].empty? && !params[:college][:location].empty? && !params[:college][:college_type].empty? && !params[:college][:setting].empty? && !params[:college][:url].empty? && !params[:college][:petersons_url].empty?
  end
 end
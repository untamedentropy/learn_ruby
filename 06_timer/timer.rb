def sec_to_s(a)

	seconds = "00"
	minutes = "00"
	hours = "00"
	separator = ":"

	if a < 0
		return "Invalid input"

	elsif a > 357839

		return "Number too large to display"
	end

	while a > 59 do

		if a > 3599

			hours_i = (a/3600).round
			hours = hours_i.to_s

			if hours_i < 10
				hours = "0" + hours
			end

			a -= hours_i*3600

		elsif a > 59
			
			minutes_i = (a/60).round

			minutes = minutes_i.to_s

			if minutes_i < 10
				minutes = "0" + minutes
			end

			a -= minutes_i*60

			
		end

	end

seconds_i = a
seconds = seconds_i.to_s

if seconds_i < 10
	seconds = "0" + seconds
end

return hours + separator + minutes + separator + seconds



end



class Timer

	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		sec_to_s(@seconds)
	end


end

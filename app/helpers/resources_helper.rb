#encoding: utf-8
module ResourcesHelper
	def beauty_checkbox_value(value)
		if value
			"Sim"
		else
			"Não"
		end
	end
end

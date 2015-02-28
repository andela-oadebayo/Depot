module ApplicationHelper
	def inline_error(obj, attrib)
		obj.errors[attrib].to_sentence
	end
end

#!/usr/bin/env ruby19
module Jekyll
	class CategoryList < Liquid::Tag

		def render(context)
			category = context.registers[:site].config["infos"]["category"] 
			result = ""
			category.keys.each do |c|
				result << %(<a href="/blog/category/#{c}">#{c} <strong>(#{category[c]})</strong></a><br/>)

			end
			result
		end
	end

	class ArchiveList < Liquid::Tag
		def render(context)
			archive = context.registers[:site].config["infos"]["archive"] 
			result = ""
			archive.keys.each do |c|
				url = c.split('/').join('#m')
				result << %(<a href="/blog/#{url}">#{c} <strong>(#{archive[c]})</strong></a><br/>)
			end
			result
		end
	end

	class TagList < Liquid::Tag
		def render(context)
			archive = context.registers[:site].config["infos"]["tags"] 
			result = ""
			archive.each do |c|
				result << %(
				<a href="/blog/tags/#{c[:title]}">
					<span style="font-size:#{c[:weight]}%">#{c[:title]}</span> 
				</a>
				)
			end
			result
		end
	end
end
Liquid::Template.register_tag('category_list', Jekyll::CategoryList)
Liquid::Template.register_tag('archive_list', Jekyll::ArchiveList)
Liquid::Template.register_tag('tag_list', Jekyll::TagList)

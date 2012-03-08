module Jekyll
	class PostIndex < Page
		def initialize(site, base, dir, posts)
			@site = site
			@base = base
			@dir = dir
			@name = 'index.html'

			self.process(@name)
			self.read_yaml(File.join(base, '_layouts'), 'posts.tpl')
			self.data['posts'] = posts
			puts data
		end
	end

	class CategoryGenerator < Generator
		priority :low
		safe true
		def generate(site)
			site.categories.keys.each do |c|
				page = PostIndex.new(site, site.source, "/blog/category/#{c}", site.categories[c])
				page.render(site.layouts, site.site_payload)
				page.write(site.dest)
				site.static_files << page
			end
		end
	end

	class TagGenerator < Generator
		priority :low
		safe true
		def generate(site)
			site.tags.keys.each do |t|
				page = PostIndex.new(site, site.source, "/blog/tags/#{t}", site.tags[t])
				page.render(site.layouts, site.site_payload)
				page.write(site.dest)
				site.static_files << page
			end
		end
	end
end


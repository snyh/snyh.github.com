module Jekyll
	class InfoGen < Generator
		safe true
		priority :highest

		def generate(site)
			site.config["infos"] = {}

			category(site.config["infos"], site)
			archive(site.config["infos"], site)
			tag_cloud(site.config["infos"], site)
			project(site.config["infos"], site)

		end

		def head_field(path, key)
			File.open(path).each do |line|
				result = /^\s*#{key}\s*:\s*(.*?)\s*$/.match(line)
				return result[1] if result
			end
			return nil
		end

		def get_readme(dir)
			Dir.glob("#{dir}/*/README.md") do |d|
				name = d.split('/')[-2]
				base = "#{dir}/#{name}"
				if File.exists? "#{base}/index.html"
					url = "/#{base}/index.html" 
				else
					url = "/#{base}/README.html"
				end
				yield item = {	
					"name" => name,
					"url" => url,
					"title" => head_field(d, "title"),
					"desc" => head_field(d, "desc")
				}
			end
		end

		def project(infos, site)
			proj = []
			get_readme("./project") do |p|
				name = p["name"]
				sub_proj = []
				get_readme("./project/#{name}") {|x| sub_proj.push x }
				p["sub"] = sub_proj if sub_proj.length > 0
				proj.push(p)
			end
			infos["project"] = proj
		end

		def category(infos, site)
			infos["category"] = {}
			categories = site.categories
			categories.keys.each do |category|
				infos["category"][category] = categories[category].length
			end
		end

		def archive(infos, site)
			tmp = {}
			site.posts.reverse.each do |post|
				y, m = post.date.year, post.date.month
				tmp[ [y,m].join('/') ] = 0 unless tmp.key? [y,m].join('/')
				tmp[ [y,m].join('/') ] += 1 
			end
			infos["archive"] = tmp
		end

		def tag_cloud(infos, site)
			infos["tags"] = []
			tags = site.tags.map do |tag|
				{
					:title => tag[0],
					:posts => tag[1]
				}
			end
			tags.sort! { |a, b| a[:title] <=> b[:title] }
			min_count = tags.min { |a, b| a[:posts].length <=> b[:posts].length }[:posts].length
			max_count = tags.max { |a, b| a[:posts].length <=> b[:posts].length }[:posts].length + 1 #避免除0
			weights = tags.inject({}) do |result, tag|
				result[tag[:title]] = (tag[:posts].length - min_count) * (280 - 75) / ( max_count - min_count ) + 75 
				result
			end
			tags.inject("") do |html, tag|
				length = tag[:posts].length

				infos["tags"].push({:title=>tag[:title], :length=>length, :weight=>weights[tag[:title]]})
			end
		end
	end
end

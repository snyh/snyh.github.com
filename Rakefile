task :default => :build

task :build => :project do
	puts %x[jekyll --no-server]
end

task :commit => :build do
	puts %x[rsync -q -acvrz --exclude .git --delete _site/ _compiled/]
	puts %x[cd _compiled && git add . && git commit -am `date +%F_%H-%M_%s`;]
end

task :release  do
	puts %x[cd _compiled && git push origin master]
end

def mov_readme(base)
	Dir.glob("#{base}/*/README.md") do |r|
		n = r.split('/')[-2]
		dir = File.dirname(r.gsub(base, "./project/"))
		dest = "#{dir}/README.md"
		mkdir_p(dir) unless File.exist? dir
		File.open(r, 'r') do |lines|
			buffer = lines.read
			File.open(dest, 'w') do |l|
				l.write("---\n")
				l.write("layout: project\n")
				l.write("title: #{n}\n")
				l.write("---\n")
				l.write(buffer)
			end
		end
	end
	Dir.glob("#{base}/*/*/README.md") do |r|
		n = r.split('/')[-2]
		dir = File.dirname(r.gsub(base, "./project/"))
		dest = "#{dir}/README.md"
		mkdir_p(dir) unless File.exist? dir
		File.open(r, 'r') do |lines|
			buffer = lines.read
			File.open(dest, 'w') do |l|
				l.write("---\n")
				l.write("layout: project\n")
				l.write("title: #{n}\n")
				l.write("---\n")
				l.write(buffer)
			end
		end
	end
end

task :project do
	mov_readme("/home/snyh/prj")
end

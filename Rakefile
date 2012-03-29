task :default => :build

task :build => :project do
    puts %x[jekyll --no-server]
end

task :clean_p do
    Dir.glob("_site/project/*") do |dir|
        if File.directory? dir
            (Dir.glob("#{dir}/*") - Dir.glob("#{dir}/*.{jpg,png,git,html}")).each do |f| 
                %x[rm -rf #{f}] unless File.directory? f
            end
        end
    end
end

task :commit => [:build, :clean_p] do
    puts %x[cd _compiled && git-remove-history .]
    puts %x[rsync -q -acvrz --exclude .git --delete _site/ _compiled/]
    #删除project目录下的多余文件
    puts %x[cd _compiled && git add . && git commit -am `date +%F_%H-%M_%s`;]
end

task :release  do
    puts %x[cd _compiled && git push -f origin master]
end


def update_img_tag(header, dir)
    tmp = ""
    imgs = "["
    Dir.glob("#{dir}/*.{png,jpg,gif}").each do |img|
        imgs << (File.basename img)
        imgs << ", "
    end
    imgs << "]"

    is_update = false
    header.lines do |l|
        if l =~ /^img:/
            tmp << "img: #{imgs}\n" if imgs != "[]"
            is_update = true
        else
            tmp << l
        end
    end

    tmp << "img: #{imgs}\n" if is_update == false and imgs != "[]"

    return tmp
end

def update_github_tag(header, title)
    is_found = false
    header.lines do |l|
        if l =~ /^githuburl:/
            is_found = true
        end
    end

    header << "githuburl: http://github.com/snyh/#{title}\n" if is_found == false 

    return header 
end

def get_head(path, title)
    result = ""
    temp = "---\nlayout: project\ntitle: #{title}\n---\n"
    return temp unless File.exist? "#{path}/README.md"

    File.open("#{path}/README.md") do |f|
        line = f.gets
        return temp unless line =~ /^-{3,}$/

        f.lines do |line| 
            break if line =~ /^-{3,}$/
            result << line 
        end
    end

    puts title

    if result.empty?
        raise EOFError, "#{path} has header but no content"
    else
        result = update_img_tag(result, "#{path}")
        result = update_github_tag(result, title)
        return "---\n" + result + "---\n\n"
    end
end

def mov_readme(base)
    (Dir.glob("#{base}/*/*/README.md") +
     Dir.glob("#{base}/*/README.md")).each do |r|
        n = r.split('/')[-2]
        dir = File.dirname(r.gsub(base, "./project/"))
        dest = "#{dir}/README.md"
        mkdir_p(dir) unless File.exist? dir
        File.open(r, 'r') do |lines|
            old = lines.read
            header = get_head(dir, n)
            File.open(dest, 'w') do |l|
                l.write(header)
                l.write(old)
            end
        end
     end
end

task :project do
    mov_readme("/home/snyh/prj")
end

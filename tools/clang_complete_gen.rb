def getDir()
    Dir.pwd.gsub(/C_Test.*/,'').chop
end

def writeClang(content)
    File.open('.clang_complete', 'w') do |file|
        content.each {|entry| file.puts entry.gsub("PROJECT_DIR", getDir()) + "\n"}
    end
end
def parseFile(name)
    content = Array[]
    File.open(name, 'r').each do |line|
        content.push(line)
    end
    content
end

includesArray= Array[]
if ARGV[0] == "REL2"
    includesArray = parseFile('clang_rel2')
else
    includesArray = parseFile('clang_rel3')
end

writeClang(includesArray);

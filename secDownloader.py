#
url_base = "https://localhost:8080/list/0"

section = "sec1.1.html"
start_num = 1
end_num = 10
suffix = "-4k.jpg"
print(section)

# open file for writing
file = open("/Users/user/Desktop/secDownloader/download/"+section, "w")

for i in range(start_num, end_num+1):
    num = str(i).zfill(2)
    if (i < 10):
        num_mod = "0"+str(i)
        string = url_base + num_mod + suffix
    else:
        string = url_base + num + suffix
    
    print(string)
    html = "<a href=\"" + string + "\">link</a><br>"
    file.write(html)

file.close()

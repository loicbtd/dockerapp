# cgi.fix_pathinfo=1

# for key in cgi.fix_pathinfo
# do
#  sed -i "s/^\($key\).*/\1 $(eval echo = \${$key})/" php.ini
# done
# ; cgi.fix_pathinfo=1


sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' php.ini
#!/usr/bin/env python3

import requests
import re
import json
import subprocess
import sys

if __name__ == '__main__':

    url = 'http://web/'
    s = requests.session()
    # addressbook won't accept the cookie if the user-agent is different
    s.headers.update({'User-Agent': 'Mozilla/5.0 SF/2.10b'})
    app = sys.argv[1] 
    
    if app == "addressbook":
        q = s.post(url + 'addressbook-mod/addressbook/index.php',
                    data={'user':'admin', 'pass':'admin'})
    elif app == "drupal":
        s.post(url + 'index.php/user/login',
            data={'name':'jAEkPot', 'pass':'jAEkPot', 'form_id':'user_login_form'})
    elif app == 'hotcrp':
        s.post(url + '?post=.empty',
            data={'email':'jaekpot@localhost.com', 'password':'jAEkPot'})
    elif app == 'joomla':
        index_page = s.get(url + 'index.php')
        csrf_token = re.findall(r'<input type="hidden" name="(\w+)" value="1"',
                                index_page.text)[-1]

        s.post(url + 'index.php', data={'username':'jAEkPot',
                                        'password':'jAEkPot',
                                        csrf_token:'1',
                                        'task': 'user.login',
                                        'option': 'com_users'})
    elif app == 'owncloud':
        index_page = s.get(url + 'index.php/login')
        csrf_token = re.findall(r'<input type="hidden" name="requesttoken" value="([^"]+)">',
                                index_page.text)[-1]

        s.post(url + 'index.php/login', data={'user':'jAEkPot',
                                              'password':'jAEkPot',
                                              'requesttoken': csrf_token})

    elif app == 'phpbb2':
        s.post(url + 'login.php', data={'username':'jAEkPot',
                                        'password':'jAEkPot',
                                        'login': 'Log in'})
    elif app == 'scarf':
        s.post(url + 'login.php', data={'email':'jaekpot@localhost.com',
                                        'password':'jAEkPot'})
    elif app == 'vanilla':
        s.post(url + 'index.php?p=/entry/signin', data={'User/Email':'jaekpot@localhost.com',
                                                        'User/Password':'jAEkPot'})
    elif app == 'wackopicko':
        s.post(url + 'admin/index.php?page=login', data={'adminname':'admin', 'password':'admin'})
    elif app == 'wordpress':
        s.post(url + 'wp-login.php', data={'log':'jAEkPot', 'pwd':'jAEkPot'})

    cookies = []
    for k, v in s.cookies.iteritems():
        cookies += ['-C', k + '=' + v]

    print(s.cookies)
    print('cookies collected, launching the crawler')

    subprocess.run(['./skipfish'] + cookies + ['-o', 'out/res/'] + sys.argv[2:])

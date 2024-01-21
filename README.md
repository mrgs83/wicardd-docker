# UnraidOS wicardd-docker

To download the file wicardd-latest.xml from GitHub directly to the default templates directory on your Unraid server, you can use the curl command. This command fetches the content from a given URL and allows you to save it to a specified location.

First, you need to SSH into your Unraid server or open the terminal on the Unraid web interface. 

Then use the following command: 

```bash
mkdir -p /mnt/user/appdata/wicardd && curl -L https://raw.githubusercontent.com/mrgs83/wicardd-docker/main/wicardd.conf -o /mnt/user/appdata/wicardd/wicardd.conf && curl -L https://raw.githubusercontent.com/mrgs83/wicardd-docker/main//wicardd-x64.xml -o /boot/config/plugins/dockerMan/templates-user/my-wicardd-x64-template.xml

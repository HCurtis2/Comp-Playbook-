# /web/config/php.ini is where the config file is.
## This will all be changing the config
Here is a list of critical items to help secure a webserver using PHP. 
- Whitelist include directories 
	- `open_basedir = "/home/user/public_html:/var/lib/php/tmp_upload:/var/lib/php/session"`
		- This is an example you may need to modify paths
- Disable url_fopen and url_include
	- `allow_url_fopen = off`
- Reduce run time / input time 
	- `max_input_time = 30`
	- `max_execution_time = 30`
- Set a tight memory limit 
	- `memory_limit = 128M`
- Disable showing php version 
	- `expose_php = off`
- Force php to only run via webserver and not direct access 
	- `cgi.force_redirect = 1`
- Limit input and upload sizes. (post max size can break file uploads. If there is a requirement for large uploads this value needs to be bigger )
	- `post_max_size = 256K` 
	- `max_input_vars = 100`
- Limit file upload size
	- `file_uploads = 1`
	- `upload_max_filesize = 1M` (could be smaller)
	- Try to keep upload_max_filesize as small as possible. 
- Change and RESTRICT a temporary file directory 
	- `upload_tmp_dir = /var/lib/php/tmp_upload`
	- By default, temporary file uploads are placed in a directory that is writeable by all system users. Lock down where you set this so files cannot execute from the directory.
- Disable error messages from showing on webpages
	- `display_errors = 0` 
	- `display_startup_errors = 0`
- Enable a log file
	- `log_errors = 1` 
	- `error_log = /home/user/error_log`
	

### Make sure to roll the passwords. 

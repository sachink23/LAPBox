
# LAPBox 🐘📦

LAPBox is a lightweight Docker image for running PHP applications with Apache, based on Ubuntu 24.04. It’s designed to provide a customizable, developer-friendly environment for building and hosting PHP-based web applications.

  

## Key Features 🚀

-  **PHP with Essential Extensions**:

	-  `mysqli`
	-  `pdo`
	-  `curl`
	-  `xml`
	-  `mbstring`
	-  `intl`
	-  `gd`
	- And more.

-  **Apache with Essential Modules**:

	-  `mod_rewrite`
	-  `mod_ssl`
	-  `mod_headers`

-  **Configuration Persistence**: Automatically restores default configurations for Apache and PHP if mounted volumes are empty.

-  **Mountable Directories**:

	-  `/etc/apache2` : Apache configuration directory.
	-  `/var/log/apache2` : Apache log directory.
	-  `/var/www` : Web root for your application.
	-  `/etc/php/8.3/apache2/php.ini` : php.ini configuration file.

-  **Built-in Flexibility**: Fully customizable for new or existing projects.

## Getting Started 🛠️
### 1. Clone the Repository
```bash
git clone  https://github.com/your-username/lapbox.git
cd lapbox
```
### 2. Build the Image
```bash
docker build -t lapbox .
```
### 3. Run the Container
```bash
docker run -d \
  -v $(pwd)/www:/var/www \
  -v $(pwd)/config/apache2:/etc/apache2 \
  -v $(pwd)/config/php.ini:/etc/php/8.3/apache2/php.ini \
  -v $(pwd)/logs:/var/log/apache2 \
  -p 8080:80 -p 8443:443 \
  lapbox
  ``` 
### 4. Test the Setup - 
  Place your web application files in the www/html directory.
  Visit http://localhost:8080 to verify your setup.

## Use Cases 🧩
- Local development for PHP projects.
- Hosting small-scale PHP applications.
- Testing web apps in a Dockerized environment.

## Contributing 🤝
Contributions are welcome! Feel free to fork the repository, make changes, and submit a pull request.

## License 📜
This project is licensed under the [MIT License](https://github.com/sachink23/LAPBox/blob/main/LICENSE).
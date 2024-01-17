# Ollama Shell Helper (osh) : English to Unix-like Shell Commands translation using Local LLMs with Ollama

![screenshot](screenshot.png)

# How it works
The user request is passed to the ollama server along with system information from `uname -a` and the distribution (if running on Linux). The result is displayed in the terminal and asks for confirmation to execute the command.

```
usage: osh.py [-h] [-y] [-s] [PROMPT]

Get a command for a unix-like shell from a model running with Ollama and execute it

positional arguments:
  PROMPT

options:
  -h, --help         show this help message and exit
  -y, --yes          Execute the command without asking for confirmation
  -s, --system-info  Display system info
```

# Usage
## Ollama
Install [ollama](https://ollama.ai/)

Pull the model:
```
ollama pull mistral
```

Start the ollama server:
```
ollama serve
```

## OSH
```
python osh.py 'update all packages'

```

# Examples with Mistral 7B
```
python osh.py 'replace occurences of "hello" with "h_ello" in abc.txt'

perl -pi -e 's/hello/h\_ello/g' abc.txt
```

```
python osh.py 'change owner of abc.txt to root'

chown root abc.txt
```

```
python osh.py 'enable docker at startup'

sudo systemctl enable docker.service
sudo systemctl start docker.service
```

```
python osh.py 'docker run an ubuntu with terminal attached and port 8080 of the host mapped to 80 of the container'

sudo docker run --rm -it -p 8080:80 ubuntu:latest /bin/bash
```


```
python osh.py 'add the user johnny with the groups docker, wheel and dev'

sudo useradd -m -g wheel -G docker,dev johnny
```

```
python osh.py 'download https://something.com/file.html and transform it into a pdf with pandoc'

wget -P ~/Downloads "https://something.com/file.html" && \
pandoc -f html -t pdf ~/Downloads/file.html -o ~/Documents/output.pdf
```





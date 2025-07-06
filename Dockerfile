# FROM python:3.13.5-alpine3.22: Especifica a imagem base do Docker. python:3.13.5-alpine3.22 é uma imagem oficial do Python, baseada no Alpine Linux, que é leve e adequada para aplicações em contêineres. A versão do Python deve corresponder à versão usada no seu projeto
FROM python:3.13.5-alpine3.22


# WORKDIR /app: Define o diretório de trabalho dentro do contêiner. Todos os comandos subsequentes serão executados neste diretório.
WORKDIR /app

# COPY requirements.txt .: Copia o arquivo requirements.txt (que lista as dependências do seu projeto) para o diretório de trabalho no contêiner. Certifique-se de que este arquivo esteja presente no mesmo diretório do Dockerfile.
COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt: Instala as dependências listadas em requirements.txt. A opção --no-cache-dir evita o armazenamento de cache do pip, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt


# COPY . .: Copia todo o conteúdo do diretório do projeto para o diretório de trabalho no contêiner. Isso inclui o seu arquivo app.py e quaisquer outros arquivos necessários.
COPY . .


# CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]: Define o comando a ser executado quando o contêiner for iniciado. Aqui, estamos usando o uvicorn, um servidor ASGI, para executar a aplicação FastAPI. app:app especifica o módulo (app.py) e a instância FastAPI (app). --host 0.0.0.0 permite que o servidor escute em todas as interfaces de rede (necessário para acesso externo ao contêiner), e --port 8000 define a porta em que o servidor irá escutar.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]


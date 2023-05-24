<div align="center">
<h1> Exemplo prático de Orquestração de Containers usando Kubernetes

<img height="200" width="200" 
src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain-wordmark.svg" />
</h1>
</div>


## Trabalho 1 - Laboratório de Engenharia de Software I
### *Prof. Eduardo Cunha Campos*
-----------
### Alunos:

  FILIPE PEREIRA BICALHO (https://github.com/F-SpaceMan) - 20203015739

  FRANCISCO ABREU GONCALVES (https://github.com/Francis1408) - 20193002285

  HENRIQUE RODRIGUES LIMA (https://github.com/Henrique-R-Lima) - 20193009473

  THALLES AUGUSTO SOARES VERCOSA (https://github.com/thallesasv) - 20183021385

----
<h3> <img height="40" width="25" align="center" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" />
<ins> O que é um Container </ins>
</h3> 

Um container ou contêiner é um ambiente virtual isolado do sistema operacional composto por um ou mais processos organizados. São utilizados para empacotar aplicações facilitando sua portabilidade para diferentes ambientes. 
As dependências de um container são especificadas em uma imagem individual.

<h3> <img height="40" width="25" align="center" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" />
<ins> O que é um Kubernetes </ins>
</h3>

O Kubernetes é uma plataforma de orquestração de contêineres de código aberto amplamente utilizada para automatizar, dimensionar e gerenciar aplicativos em contêineres. Ele foi desenvolvido pelo Google e posteriormente doado à Cloud Native Computing Foundation (CNCF).
Com o Kubernetes, é possível implantar, dimensionar e gerenciar aplicativos em contêineres de maneira eficiente, fornecendo recursos poderosos para automação e gerenciamento de infraestrutura. Ele simplifica a implantação e o gerenciamento de aplicativos distribuídos em um ambiente de produção, lidando com tarefas complexas, como o balanceamento de carga, a recuperação de falhas e a escalabilidade automática.

<h3> <img height="40" width="25" align="center" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" />
<ins> Principais recursos</ins>
</h3>

* *Orquestração:* O Kubernetes gerencia automaticamente a implantação, o dimensionamento e a escalabilidade de aplicativos em contêineres, garantindo que a carga de trabalho seja distribuída de forma eficiente entre os nós do cluster.

* *Pods:* Um pod é a unidade básica no Kubernetes, que representa um ou mais contêineres que são implantados juntos em um único nó. Os pods são escaláveis, gerenciáveis e oferecem um ambiente de execução para os contêineres.

* *Implantação (Deployment):* A implantação é uma abstração que define o estado desejado do aplicativo e gerencia a criação, atualização e remoção dos pods. Ela garante que o número especificado de réplicas do pod esteja em execução em todos os momentos.

* *Serviços:* Um serviço é uma abstração que define uma política de acesso e descoberta para os pods. Ele permite que os aplicativos sejam expostos internamente dentro do cluster ou externamente através de balanceadores de carga.

* *Escalonamento automático:* O Kubernetes suporta o escalonamento automático dos pods com base na utilização de recursos, como a CPU, permitindo que os aplicativos se adaptem dinamicamente à carga de trabalho.

* *Descoberta de serviço e DNS interno:* O Kubernetes fornece um DNS interno que permite que os serviços sejam descobertos facilmente por nome dentro do cluster.

* *Gerenciamento de segredos e configurações:* O Kubernetes oferece recursos para armazenar e gerenciar segredos, como senhas e tokens de autenticação, bem como configurações de aplicativos em formato de chave-valor.

<h3> <img height="40" width="25" align="center" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" />
<ins> Exemplo prático </ins>
</h3>

Neste exemplo básico queremos executar um programa que exibe "Hello, world!" no terminal do nosso contêiner. Usamos então o Kubernetes para implantar e gerenciar o nosso app helloworld em containers Docker:

1. **Configuração do ambiente:**

   * Instalar e configurar o Docker.

   * Instalar e configurar o Kubernetes.

   * Verificar se o cliente do Kubernetes (kubectl) está instalado e configurado corretamente.

2. **Criar um arquivo helloworld.py**

```python
print("Hello, world!")
```

3. **Criar o Dockerfile**

O Dockerfile é o arquivo fonte para a imagem do container. Nele especificamos como o código-fonte do nosso app deve ser compilado, dependências etc.
Criamos o Dockerfile no mesmo diretório de helloworld.py.

Exemplo de Dockerfile

```dockerfile
FROM python:3

WORKDIR /app
COPY helloworld.py .

CMD ["python", "helloworld.py"]
```

Então criamos a imagem do container usando o seguinte comando

```shell
docker build -t hello-world-image .
```

4. **Criar um arquivo de manifesto do Kubernetes**

   * No mesmo diretório, criar um arquivo YAML (por exemplo, "app-deployment.yaml") para definir os recursos necessários para implantar o aplicativo.

   * No [arquivo YAML](https://github.com/Francis1408/Kubernetes-Manual/blob/main/hello-world-deployment.yml), definir um objeto Deployment para especificar os detalhes da implantação, como o nome, o número de réplicas, a imagem do contêiner, as portas expostas, etc.

Exemplo de arquivo YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      labels:
        app: hello-world
    spec:
      containers:
        - name: hello-world-container
          image: hello-world-image
          ports:
            - containerPort: 80
```

5. **Implante o aplicativo:**

   * Use o comando kubectl para criar o objeto de implantação usando o arquivo de manifesto YAML.

```shell
kubectl apply -f app-deployment.yaml
```

6. **Verifique o status da implantação**

   * Use o comando kubectl para verificar se a implantação foi concluída com êxito e se os pods estão em execução.

```shell
kubectl get deployment hello-world
```
```shell
kubectl get pods -l app=hello-world
```

7. **Exponha o aplicativo:**

   * Para permitir o acesso ao aplicativo de fora do cluster, você pode criar um objeto de serviço.

```shell
	kubectl expose deployment hello-world  --type=LoadBalancer --port=80
```

8. **Verifique o serviço exposto:**

   * Use o comando kubectl para verificar o serviço e obter informações sobre o ponto de extremidade.

```shell
kubectl get service hello-world
```

Agora temos o aplicativo implantado e acessível por meio do serviço exposto. Esse é apenas um exemplo básico, que não explora nem esgota todas as funcionalidades dos contêines e do Kubernetes.

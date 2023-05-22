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
    FILIPE PEREIRA LIMA BICALHO
    FRANCISCO ABREU GONCALVES
    HENRIQUE RODRIGUES LIMA
    THALLES AUGUSTO SOARES VERCOSA
-----

<h3> <img height="40" width="25" align="center" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" />
<ins> O que é um Container </ins>
</h3> 

Um container é um ambiente virtual isolado do sistema operacional composto por um ou mais processos organizados. São utilizados para empacotar aplicações facilitando sua portabilidade para diferentes ambientes. 
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

Aqui está um exemplo básico de como usar o Kubernetes para implantar e gerenciar um aplicativo em contêiner:

1. **Configuração do ambiente:**


    * Instalar e configurar o Kubernetes.

    * Verificar se o cliente do Kubernetes (kubectl) está instalado e configurado corretamente.

2. **Criar um arquivo de manifesto do Kubernetes:**

    * Criar um arquivo YAML (por exemplo, "app-deployment.yaml") para definir os recursos necessários para implantar o aplicativo.

    * No [arquivo YAML](https://github.com/Francis1408/Kubernetes-Manual/meu-aplicativo), definir um objeto Deployment para especificar os detalhes da implantação, como o nome, o número de réplicas, a imagem do contêiner, as portas expostas, etc.

Exemplo de arquivo YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: meu-aplicativo
spec:
  replicas: 3
  selector:
    matchLabels:
      app: meu-aplicativo
  template:
    metadata:
      labels:
        app: meu-aplicativo
    spec:
      containers:
        - name: meu-aplicativo-container
          image: meu-aplicativo:latest
          ports:
            - containerPort: 80
```
3. **Implante o aplicativo:**

* Use o comando kubectl para criar o objeto de implantação usando o arquivo de manifesto YAML.

```shell
kubectl apply -f app-deployment.yaml
```
4. **Verifique o status da implantação**

* Use o comando kubectl para verificar se a implantação foi concluída com êxito e se os pods estão em execução.

```shell
kubectl get deployment meu-aplicativo
```
```shell
kubectl get pods -l app=meu-aplicativo
```
5. **Exponha o aplicativo:**

* Para permitir o acesso ao aplicativo de fora do cluster, você pode criar um objeto de serviço.

```shell
	kubectl expose deployment meu-aplicativ  --type=LoadBalancer --port=80
```

6. **Verifique o serviço exposto:**

* Use o comando kubectl para verificar o serviço e obter informações sobre o ponto de extremidade.

```shell
kubectl get service meu-aplicativo
```

Agora você tem um aplicativo implantado e acessível por meio do serviço exposto. Esse é apenas um exemplo básico, e o Kubernetes oferece muitos recursos avançados para gerenciar aplicativos em contêiner de forma escalável e resiliente.

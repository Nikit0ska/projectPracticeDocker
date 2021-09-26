FROM postgres

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD ./requirements.txt /app
ADD ./readme.txt /app
RUN apt-get update
RUN apt-get install -y python
RUN apt-get install -y git
RUN apt install python3-pip -y
RUN apt-get install unixodbc unixodbc-dev -y
RUN apt-get install odbc-postgresql -y
RUN apt-get clean -y
RUN pg_createcluster 13 main



RUN pip install -r requirements.txt
RUN apt-get install gcc
RUN git clone https://github.com/Nikit0ska/ProjectPractice.git


WORKDIR /
ADD start.sh /start.sh
RUN sed -i 's/\r$//' start.sh
RUN chmod 777 start.sh
CMD ./start.sh